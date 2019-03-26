## ---- message=F----------------------------------------------------------
library(ggplot2)
library(foreach)
registerDoSEQ()
library(dplyr)
library(tidyr)
library(bossMaps)
library(raster)

## ------------------------------------------------------------------------
species=c("Tinamus_solitarius")


data("Tinamus_solitarius_points")
data("Tinamus_solitarius_range")
data("Tinamus_solitarius_env")

points=Tinamus_solitarius_points
range=Tinamus_solitarius_range
env=Tinamus_solitarius_env

## ------------------------------------------------------------------------
rdist = rangeDist(
  range = range,
  points = points,
  domain = env,
  domainkm = 1000,
  mask = F,
  fact = 2
  )

## Crop environmental data to this new domain (based on domainkm)
env_domain = crop(env, rdist)

## Mask pixels with no environmenta data (over ocean, etc.)
rdist = mask(rdist, env_domain[[1]])
names(rdist) = "rangeDist"
  
plot(rdist)
plot(range, add = T)
plot(points, add = T)

## ----fig.width=7---------------------------------------------------------
rates=checkRates(rdist)

## ------------------------------------------------------------------------
vars=expand.grid(
  prob=c(0.5, 0.7, 0.9),
  rate=c(0,0.01,0.1,10),
  skew=0.5,
  shift=0,
  stringsAsFactors=F)
x=seq(-150,500,len=1000)

## ------------------------------------------------------------------------
uvars=unique(vars[,c("rate","skew","shift")])
erd=do.call(rbind,
            lapply(1:nrow(uvars),function(i) {
              y=logistic(x,
                         parms=unlist(c(lower=0,upper=1,uvars[i,])))  
              return(cbind.data.frame(
                group=i,
                c(uvars[i,]),
                x=x,
                y=y))
            })
)  

## ------------------------------------------------------------------------
ggplot(erd,
       aes(
       x = x,
       y = y,
       linetype = as.factor(skew),
       colour = as.factor(rate),
       group = group
       )) +
       geom_vline(aes(xintercept = 0), colour = "red") +
       geom_line() +
       xlab("Prior value (not normalized)") +
       xlab("Distance to range edge (km)")

## ------------------------------------------------------------------------
dists = freq(rdist, useNA = "no", digits = 2)
knitr::kable(head(dists))

## ----warning=F, results="hide", message=F--------------------------------
mcoptions <- list(preschedule = FALSE, set.seed = FALSE)
foreach(i = 1:nrow(vars), .options.multicore = mcoptions) %do% {
  ## calculate the expert range prior
  fo = paste0(species, "_prior_", paste(vars[i, ], collapse = "_"), ".grd")
  if (file.exists(fo))  return(NULL)
  expert = rangeOffset(
                      rdist,
                      parms = unlist(vars[i, ]),
                      dists = dists,
                      doNormalize = T,
                      verbose = T,
                      doWriteRaster = T,
                      filename = fo,
                      overwrite = T,
                      datatype = "FLT4S"
                      )
}

## ------------------------------------------------------------------------
fs = list.files(pattern = "prior.*grd$",
                full = T,
                recursive = F)
                
priors = stack(fs)
                
## build prior table from metadata
priorf = foreach(i = 1:nlayers(priors), 
                 .combine = bind_rows) %do% {
  t1 = metadata(priors[[i]])
  t2 = t1$parms
  names(t2) = t1$pnames
  return(data.frame(id = i, t(t2)))
  }

names(priors) = paste0("prior", priorf$id)#basename(fs[wp])

## ------------------------------------------------------------------------
## build single raster stack of all needed data (env and priors)
rdata = stack(env, priors)

## generate presence and non-detection datasets
pres = cbind.data.frame(
  presence = 1, 
  raster::extract(rdata, points, df =
  T, ID = F))
ns = 10000
abs = cbind.data.frame(
  presence = 0,
  ID = 1:ns,
  sampleRandom(rdata, ns))

data = rbind.data.frame(
  pres, 
  abs)

## ---- warning=F----------------------------------------------------------
data$weight = 1e-6
best.var = names(env)

# number of non-NA cells
nc = cellStats(!is.na(priors[[1]]), sum)

data$weight[data$presence == 0] = nc / sum(data$presence == 0)

## Set up models
formulas = paste(
  "presence/weight ~",
  " offset(log(",
  grep("prior", 
       colnames(data),
       value = T),'))+',
  paste0(sapply(
    best.var, function(ii) {
      sapply(best.var, function(jj) {
        paste0(ii, "*", jj)
    })
  }), collapse = '+'),
  '+',
  paste0('I(', best.var, '^2)', collapse = '+'),
  '+',
  paste0(best.var, collapse = ':')
)

formulas[1]

mods = foreach(f = formulas) %do% {
  glm(
    as.formula(f),
    family = poisson(link = log),
    data = data,
    weights = weight
  )
}

## ------------------------------------------------------------------------
priorf$AIC=unlist(lapply(mods,function(x) AIC(x)))

## ------------------------------------------------------------------------
mcoptions <- list(preschedule = FALSE, set.seed = FALSE)

ptype = "response"
psi = 1:nrow(priorf)

ps = foreach(i = psi, 
  .options.multicore = mcoptions) %dopar% {
    fo = paste0(
      species,"_posterior_",
      priorf$prob[i],"_",
      priorf$rate[i],"_",
      priorf$skew[i],"_",
      priorf$shift[i],
      ".grd"
      )
  if (file.exists(fo))
    return(NULL)
  #if(!file.exists(fo)) return("NOT YET")
  normalize(
    raster::predict(
      rdata,
      mods[[i]],
      type = ptype),
    file = fo,
    overwrite = T)
}

psf = list.files(pattern = "posterior.*.grd", full = T)
ps = stack(psf)
names(ps) = sub("prior", "posterior", names(priors)[psi])

## ----fig.width=10,fig.height=10,message=F--------------------------------
res = 1e4
p_psn = rasterVis::gplot(ps, max = res) + geom_raster(aes(fill = value))
p_psn$data$id = as.numeric(sub("prior|posterior", "", p_psn$data$variable))
p_psn$data$rate = priorf$rate[p_psn$data$id]
p_psn$data$prob = priorf$prob[p_psn$data$id]

p_psn + 
  facet_grid(prob ~ rate, labeller = label_both) +
  scale_fill_gradientn(
    colours = hcols(100, bias = .5),
    trans = "log10",
    name = "Relative Occurrence Rate\np(x|Y=1)",
    na.value = "transparent"
  ) +
  geom_polygon(
    aes(x = long, y = lat, group = group),
    data = fortify(range),
    fill = "transparent",
    col = "black",
    size = .2
  ) +
  geom_point(
    aes(x = coords.x1, y = coords.x2),
    data = as.data.frame(coordinates(points[points$presence == 1,])),
    col = "black",
    size = .5
  ) +
  geom_text(
    aes(
      -30,-40,
      label = paste0("AIC=", round(AIC),
                     ifelse(
                       round(fitbuffer) == 0, "", 
                       paste0("\nFitDist=", round(fitbuffer), " km")
                     )),
      group = NULL
    ),
    data = priorf,
    hjust = 1,
    size = 2
  ) +
  ylab("Latitude") + xlab("Longitude") +
  coord_equal()

## ------------------------------------------------------------------------
## Extract transect
transect = SpatialLinesDataFrame(SpatialLines(list(Lines(list(
  Line(cbind(c(-51.85,-62.45), c(-26.01,-14.82)))
), ID = "a"))),
data.frame(Z = c("transect"), row.names = c("a")))


trans = do.call(
  rbind.data.frame,
  raster::extract(
    stack(rdist, rdata, ps),
  transect,
  along = T,
  cellnumbers = T
  ))

trans[, c("lon", "lat")] = coordinates(rdata)[trans$cell]
## get order to identify non-monotonic increase
trans$order = 1:nrow(trans)
## drop pixels in which range dist is decreasing as order increases
## This is to remove situation if transect starts from not-center of rangemap
## e.g. plot(order~rangeDist,data=trans)
trans = trans[trans$order > trans$order[which.min(trans$rangeDist)], ]

transl = group_by(trans, lon, lat) %>%
  gather(variable, value,-lon,-lat,-cell,-rangeDist,-order)

## separate prior/posterior data
transp = filter(transl, !variable %in% c("bio1", "bio12"))

## add prior id column
transp$type = ifelse(grepl("prior", transp$variable), "Offset", "Prediction")
transp$id = as.numeric(sub("prior|posterior", "", transp$variable))
## order levels for convenient plotting
transp$type = factor(transp$type,
                     levels = c("Prediction", "Offset"),
                     ordered = T)
## add prior information
transp$rate = priorf$rate[match(transp$id, priorf$id)]
transp$prob = priorf$prob[match(transp$id, priorf$id)]
transp = transp[order(transp$rangeDist), ]
transp$label = factor(paste0("Rate=", transp$rate, " Prob=", transp$prob), ordered =
                        T)

## ------------------------------------------------------------------------
ggplot(transp, aes(
  x = rangeDist,
  y = value,
  colour = type,
  group = type
)) +
  scale_y_log10() +
  facet_grid(prob ~ rate, labeller = label_both) +
  geom_vline(xintercept = 0,
             linetype = "dashed",
             colour = "black") +
  geom_path() +
  xlab("Distance from range edge") +
  ylab("Relative Occurrence Rate P(X|Y=1)") +
  scale_color_manual(values = c("red", "black")) +
  ggtitle(paste(species, " prior and posterior values along transect"))

