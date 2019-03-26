## ----setup, include=FALSE, echo=FALSE------------------------------------
if(!require(knitr)){
  install.packages("knitr", repos='http://cran.us.r-project.org')
}
if(!require(rmarkdown)){
  install.packages("rmarkdown", repos='http://cran.us.r-project.org')
}
if(!require(plyr)){
  install.packages("plyr", repos='http://cran.us.r-project.org')
}
if(!require(reshape2)){
  install.packages("reshape2", repos='http://cran.us.r-project.org')
}
if(!require(ggplot2)){
  install.packages("ggplot2", repos='http://cran.us.r-project.org')
}
if(!require(scales)){
  install.packages("scales", repos='http://cran.us.r-project.org')
}
if(!require(MuMIn)){
  install.packages("MuMIn", repos='http://cran.us.r-project.org')
}
if(!require(rsq)){
  install.packages("rsq", repos='http://cran.us.r-project.org')
}
# then load the package:
library(knitr)
library(rmarkdown)
library(plyr)
library(reshape2)
library(ggplot2)
library(scales)
library(MuMIn)
library(rsq)
library(NitrogenUptake2016)


knitr::opts_chunk$set(echo = TRUE, comment=NA)

## ---- echo = FALSE, include=FALSE----------------------------------------
# if the NitrogenUptake2016 package isn't installed, use devtools to do so:
# devtools::install_github("troyhill/NitrogenUptake2016", build_vignettes = TRUE)

# set some constants
todaysDate <- substr(as.character(Sys.time()), 1, 10)
core.area <- pot.m2 <- 0.00801185 # mesocosm surface area (m2)
top.vol   <- core.area * 0.05 * 1e6 # cm3 in core: top 5 cm only
pointSize <- 2 # for ggplot graphics
pd <- pd2 <- position_dodge(1.2)
pd3 <- position_dodge(0.8)
grayColor <- 0.55
fig2Col   <- "gray55"



## ----allometry, include=FALSE, echo=FALSE--------------------------------

# Allometry ----------------------------------------------------------------

##### Establish relationships following Lu et al. 2016
CSP <- plyr::dlply(allometry, c("spp"), bCM)
CSP.coef <- plyr::ldply(CSP, stats::coef)
CSP.coef$lam <- plyr::ddply(allometry, c("spp"), function(df)  bCM(df, lam.only = TRUE))[, "V1"]
CSP.coef$BIC <- plyr::ldply(CSP, stats::BIC)[, "V1"]
CSP.coef$rsq <- plyr::ldply(CSP, MuMIn::r.squaredGLMM)[, "R2m"]
#CSP.coef


## ----applying allometry to estimate plant masses, include=FALSE, echo=FALSE----

### estimate plant masses from allometry
for (i in 1:nrow(stemHeights)) {
  if (stemHeights$species[i] %in% "DS") {
    stemHeights$mass[i] <- (stemHeights$height_cm[i] * CSP.coef[1, 3] + CSP.coef[1, "(Intercept)"])^(1/CSP.coef$lam[1]) # DISP
  } else if (stemHeights$species[i] %in% "SA") {
    stemHeights$mass[i] <- (stemHeights$height_cm[i] * CSP.coef[2, 3] + CSP.coef[2, "(Intercept)"])^(1/CSP.coef$lam[2]) # SPAL
  }
}



## ----Allometry validation: comparison between predicted and harvested masses, include=FALSE, echo=FALSE----
###
### compare predicted (allometry) and observed masses at harvest
###


# get live + dead biomass for each pot at each date
dat.ld <- plyr::ddply(stemHeights, plyr::.(core_num, species, date), plyr::summarise,
                live = sum(mass[dead_live %in% "L"], na.rm = TRUE),
                dead = sum(mass[dead_live %in% "D"], na.rm = TRUE)
)

# add cohort number
dat.ld$day <- as.POSIXct(as.character(dat.ld$date), format = "%y%m%d", origin = "1960-01-01")
dat.ld$cohort <- NA

for (i in 1:length(unique(dat.ld$day))) {
  uniqueIDS <- unique(dat.ld$core_num[dat.ld$day == sort(unique(dat.ld$day))[i]])
  if (length(uniqueIDS) == 3) {
    dat.ld$cohort[dat.ld$core_num %in% uniqueIDS] <- ifelse(sum(is.finite(dat.ld$cohort)) == 0, 1, max(dat.ld$cohort, na.rm = TRUE) + 1)
  }
}
dat.ld$cohort[is.na(dat.ld$cohort)] <- 0
dat.ld$cohort[dat.ld$cohort == 5] <- 4


dat.ld$year <- 2016
dat.ld$dead <- 0
dat.ld$pot2  <- paste0(dat.ld$core_num, "-", dat.ld$species)



### allometry estimates
for (i in 1:length(unique(dat.ld$pot2))) {
  targPot <- unique(dat.ld$pot2)[i]
  maxDate <- max(dat.ld$day[dat.ld$pot2 %in% targPot])
  tempDat <- dat.ld[(dat.ld$pot2 %in% targPot) & (dat.ld$day == maxDate), ]
  if (i == 1) {
    dat.ld.sub  <- tempDat
  }
  if (i > 1) {
    dat.ld.sub <- rbind(dat.ld.sub, tempDat)
  }
}
dat.ld.sub$id <- paste0(dat.ld.sub$species, "-", dat.ld.sub$core_num)

### observed values
obs <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("leaf 1", "leaf 2", "leaf 3", "leaf 4", # "dead leaf",
                                            "leaf 5", "leaf 6", "leaf 7", "leaf 8", "leaf 9", "leaf 10", "leaf 11",
                                            "stems"), ], plyr::.(time, species, new.core.id), plyr::summarise,
             g        = sum(g_core, na.rm = T)
)
obs$core_num <- as.character(as.integer(substr(obs$new.core.id, 3, 4)))
obs$core_num[as.integer(obs$core_num) > 12] <- paste0(obs$species[as.integer(obs$core_num) > 12], as.integer(obs$core_num[as.integer(obs$core_num) > 12]) - 12, "_T0")
obs$id <- paste0(obs$species, "-", obs$core_num)

obs <- plyr::join_all(list(obs, dat.ld.sub[, c(4,9:10)]), by = "id")
names(obs)[which(names(obs) %in% "live")] <- "allom.est"
obs$diff <- (obs$allom.est - obs$g)             # magnitude accuracy of allometry prediction (g)
obs$diff.pct <- (obs$allom.est - obs$g) / obs$g # percent accuracy of allometry prediction
obs$species2 <- ifelse(obs$species %in% "SA", "italic(S.~alterniflora)", "italic(D.~spicata)")
summary(obs$diff)

## ----Relative growth rates, include=FALSE, echo=FALSE--------------------

# Relative growth rates ---------------------------------------------------
stemHeights$RGR <- stemHeights$lateStartDate <- NA

for(i in 1:length(unique(stemHeights$id[stemHeights$dead_live %in% "L"]))) { # 830 plants
  targPlant <- unique(stemHeights$id[stemHeights$dead_live %in% "L"])[i]
  subDat <- stemHeights[stemHeights$id %in% targPlant, ]
  if (nrow(subDat) > 1) {
    subDat$mass2 <- c(NA, subDat$mass[1:(nrow(subDat)-1)])
    subDat$day2 <- c(subDat$day[1], subDat$day[1:(nrow(subDat)-1)])
    subDat$RGR <- (log(subDat$mass) - log(subDat$mass2)) / as.numeric(difftime(subDat$day, subDat$day2, units = "days"))
    ### add RGRs to dat.live object
    stemHeights$RGR[(which(rownames(stemHeights) %in% rownames(subDat)))] <- subDat$RGR
    if (!is.na(subDat$height[1]) & (subDat$height[1] < 6)) {
      stemHeights$lateStartDate[which(rownames(stemHeights) %in% rownames(subDat))] <- 1 # indicates if high-growth period is captured
    }
  }
}

stemHeights$RGR[!is.finite(stemHeights$RGR)] <- NA

# mean growth rate for each plant, then each mesocosm
mean.rgr     <- plyr::ddply(stemHeights[stemHeights$dead_live %in% "L", ], plyr::.(id, new.core.id, species), plyr::summarise, meanRGR = mean(RGR, na.rm = TRUE))
mean.rgr.pot <- plyr::ddply(mean.rgr, plyr::.(new.core.id, species), plyr::summarise, RGR = mean(meanRGR, na.rm = TRUE))
mean.rgr.pot <- mean.rgr.pot[1:24, ]


## ----stem density and primary production, include=FALSE, echo=FALSE------
# Stem density and biomass ------------------------------------------------

### summarize by pot and session
dat.live <- stemHeights[stemHeights$dead_live %in% "L", ]
ddHgt2 <- plyr::ddply(dat.live, plyr::.(date, day, core_num, species), plyr::numcolwise(sum, na.rm = TRUE))
ddHgt2$day <- as.POSIXct(ddHgt2$day, origin = "1960-01-01")
ddHgt2$cohort <- NA

for (i in 1:length(unique(ddHgt2$date))) {
  uniqueIDS <- unique(ddHgt2$core_num[ddHgt2$date == sort(unique(ddHgt2$date))[i]])
  if (length(uniqueIDS) == 3) {
    ddHgt2$cohort[ddHgt2$core_num %in% uniqueIDS] <- i
  }
}
ddHgt2$cohort <- (ddHgt2$cohort - 1) / 2
ddHgt2$cohort[is.na(ddHgt2$cohort)] <- 0


ddHgt4 <- plyr::ddply(ddHgt2, plyr::.(day, cohort, species), plyr::numcolwise(mean, na.rm = TRUE))
ddHgt4.se <- plyr::ddply(ddHgt2, plyr::.(day, cohort, species), plyr::numcolwise(se))
names(ddHgt4.se) <- paste0(names(ddHgt4.se), ".se")
ddHgt4 <- cbind(ddHgt4, ddHgt4.se[, c(5, 7, 9)])
ddHgt4$session <- as.POSIXct(ddHgt4$day, origin = "1960-01-01")
ddHgt4$species2 <- ifelse(ddHgt4$species %in% "SA", "italic(S.~alterniflora)", "italic(D.~spicata)")



####
#### Calculate Milner-Hughes NAPP
####
test <- nappCalc2(dataset = dat.ld[dat.ld$cohort > 0, ], liveCol = "live", siteCol = "pot2", timeCol = "day", summarize = "TRUE", annualReset = "FALSE")
napp <- test$summary
napp$pot2 <- as.character(napp$site)
napp$core_num <- as.numeric(sapply(strsplit(napp$pot2, "-"),  "[[", 1))
napp$species  <- sapply(strsplit(napp$pot2, "-"),  "[[", 2)

napp$cohort <- dat.ld$cohort[match(napp$pot2, dat.ld$pot2)]
napp$new.core.id <- ifelse(napp$core_num > 9, paste0(napp$species, napp$core_num), paste0(napp$species, "0", napp$core_num))


### build object to merge with master: average RGR, stem characteristics
# mean growth rate for each plant, then each mesocosm
mean.rgr     <- plyr::ddply(stemHeights[stemHeights$dead_live %in% "L", ], plyr::.(id, new.core.id, species), plyr::summarise, meanRGR = mean(RGR, na.rm = TRUE))
mean.rgr.pot <- plyr::ddply(mean.rgr, plyr::.(new.core.id, species), plyr::summarise, rgr = mean(meanRGR, na.rm = TRUE))
mean.rgr.pot <- mean.rgr.pot[1:24, ]

mean.dens     <- plyr::ddply(stemHeights[stemHeights$dead_live %in% "L", ], plyr::.(new.core.id, date), plyr::summarise, stem.density = sum(!is.na(height_cm)))
mean.dens.pot <- plyr::ddply(mean.dens, plyr::.(new.core.id), plyr::summarise, dens = mean(stem.density / pot.m2, na.rm = TRUE)) # mean of all stem density msrmts for a pot
mean.dens.pot <- mean.dens.pot[1:24, ]

rgr.stems <- plyr::join_all(list(mean.rgr.pot, mean.dens.pot), by = "new.core.id")


## ----Denitrification enzyme activity and ambient N2O flux, include = FALSE, echo = FALSE, message = FALSE----

# Denitrification enzyme activity -----------------------------------------

dea$species  <- substr(dea$pot, 1, 2)
dea$species2 <- ifelse(dea$species %in% "SA", "italic(S.~alterniflora)", "italic(D.~spicata)")
dea$DEA.m2   <- dea$DEA * dea$bd_gcm3 * (top.vol / core.area) # * 5 * 1e4 # [flux per gram] * [g/cm3] * [5 cm depth] * [cm2/m2]
dea$IV.m2    <- dea$IV * dea$bd_gcm3  * (top.vol / core.area) # * 5 * 1e4
dea$gap.g    <- dea$DEA - dea$IV
dea$gap.m2   <- dea$DEA.m2 - dea$IV.m2

dd.dea <- plyr::ddply(dea, plyr::.(species, species2), plyr::summarise,
                flux.g = mean(DEA),
                flux.m2 = mean(DEA.m2),
                flux.g.se = se(DEA),
                flux.m2.se = se(DEA.m2)
)
dd.dea$type <- "DEA"

dd.iv <- plyr::ddply(dea, plyr::.(species, species2), plyr::summarise,
               flux.g = mean(IV),
               flux.m2 = mean(IV.m2),
               flux.g.se = se(IV),
               flux.m2.se = se(IV.m2)
)
dd.iv$type <- "GHG"

dd.dea <- rbind(dd.dea, dd.iv)


### stats on DEA/IV N2O flux
dea.m     <- reshape2::melt(dea, id.vars = c("species", "species2", "pot"), measure.vars = c(2, 3, 8:11))
dea.m$ID  <- paste0(dea.m$species, "-", dea.m$variable)

# dea.g.aov <- stats::aov(value ~ factor(variable) * factor(species), data = dea.m[(dea.m$variable %in% c("IV.m2", "DEA.m2")), ])
# car::Anova(dea.g.aov, type = 2, singular = TRUE) # difference between methods, but not species

## ----15N spike, include=FALSE, echo=FALSE--------------------------------
# how much 15N was added to each pot?
KNO3    <- 2.24047           # grams of KNO3 added
soln    <- 2027.5            # final volume of spike solution (mls)
KNO3_mw <- 102.1032       # g/mol
N_mw    <- 15                # gN/mol KNO3
mls     <- 12                # mls added per mesocosm
spike   <- KNO3 * (N_mw / KNO3_mw) / soln * mls # total grams of 15N added to each mesocosm


# calculate atom pct from per mil values
CN_mass_data$n_ap <- ap(CN_mass_data$d15n)


## ----15N background, include=FALSE, echo=FALSE---------------------------

# get background 15N AP
bkd <- plyr::ddply(CN_mass_data[as.character(CN_mass_data$time) %in% "t0", ], plyr::.(species, pool_label), plyr::summarise,
             n15 = mean(n_ap, na.rm = T),
             se.n15 = se(n_ap)
)


## ----15N corrections, include=FALSE, echo=FALSE--------------------------
# subtract background to get 15N excess (if result is negative, 15Nxs = 0)
CN_mass_data$n15xs <- as.numeric(NA)
for(i in 1:nrow(CN_mass_data)) {
  if(!is.na(CN_mass_data$species[i])) {
    spp  <- CN_mass_data$species[i]
    pool <- CN_mass_data$pool_label[i]

    a <- bkd[(bkd$species %in% spp) & (bkd$pool_label %in% pool), "n15"]

    if((is.numeric(a) & (length(a) > 0))) { # excludes all pools we don't have bkd for
      difference <- CN_mass_data$n_ap[i] - a # NOT decimal fraction
      ifelse (!is.na(difference) & (difference > 0), CN_mass_data$n15xs[i] <- difference, CN_mass_data$n15xs[i] <- 0)
    } else {
      difference <- CN_mass_data$n_ap[i] - 0.370317701 # assume bkgd of 11 d15N
      ifelse ((difference > 0) & !is.na(difference), CN_mass_data$n15xs[i] <- difference, CN_mass_data$n15xs[i] <- 0)
    }
  }
}


### Additional correction to belowground live biomass, subtracting 15Nxs of dead MOM to account for sorption
CN_mass_data$n15xs_MOM <- CN_mass_data$n15xs # n15xs still useful for total recoveries
for(i in 1:nrow(CN_mass_data)) {
  if (CN_mass_data$time[i] %in% paste0("t", 1:4)) {
    if(!is.na(CN_mass_data$depth_top[i])) {
      spp    <- CN_mass_data$species[i]
      coreID <- CN_mass_data$new.core.id[i]
      pool   <- CN_mass_data$pool_label[i]
      depth_bottom <- CN_mass_data$depth_bottom[i]

      a <- CN_mass_data[(CN_mass_data$new.core.id %in% coreID) & (CN_mass_data$pool_label %in% paste0("dead biomass ", depth_bottom, "cm")) &
                   (CN_mass_data$depth_bottom == depth_bottom), "n15xs"]

      if((is.numeric(a) & (length(a) > 0))) { # excludes all pools we don't have bkd for
        difference <- CN_mass_data$n15xs[i] - a # NOT decimal fraction
        ifelse (!is.na(difference) & (difference > 0), CN_mass_data$n15xs_MOM[i] <- difference, CN_mass_data$n15xs_MOM[i] <- 0)
      } else {
        difference <- CN_mass_data$n_ap[i] - 0.370317701 # assume bkgd of 11 d15N
        ifelse ((difference > 0) & !is.na(difference), CN_mass_data$n15xs_MOM[i] <- difference, CN_mass_data$n15xs_MOM[i] <- 0)
      }
    }
  }
}



CN_mass_data$n15_g_pg_recov  <- CN_mass_data$n15xs  / 100 * CN_mass_data$n_pct  # for total recovery
CN_mass_data$n15_g_recov     <- CN_mass_data$n15_g_pg_recov  * CN_mass_data$g_core  # for total recovery

CN_mass_data$n15_g_pg <- CN_mass_data$n15xs_MOM / 100 * CN_mass_data$n_pct
CN_mass_data$n15_g    <- CN_mass_data$n15_g_pg  * CN_mass_data$g_core
CN_mass_data$n_core   <- CN_mass_data$n_pct * CN_mass_data$g_core


## ----15N recovery by pool, include=FALSE, echo=FALSE---------------------

# get 15Nxs mass in each pool in each core
# total recovery using belowground pools (rather than bulk sediment)
mat2 <- plyr::ddply(CN_mass_data[!CN_mass_data$sample.type %in% c("bulk sediment"), ], plyr::.(time, species, new.core.id), plyr::summarise,
              n15_2 = sum(n15_g_recov, na.rm  = T)
)
mat2$recovery2 <- mat2$n15_2 / (spike) # "recovery" uses bulk belowground data, "recovery2" uses root pools
mat2$days <- as.numeric(substr(mat2$time, 2, 2)) * 7

### relps between napp and 15n recoveries (excludes dead biomass)
bgd <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("coarse roots", "fine roots", "rhizomes"), ],
             plyr::.(time, species, new.core.id), plyr::summarise,
             g        = sum(g_core, na.rm = T),
             n15    = sum(n15_g, na.rm  = T),
             n_core   = sum(n_core, na.rm = T)
)
bgd$g_pg <- bgd$n15 / bgd$g


# species-level belowground inventory over time
abv <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("decomp layer", "leaf 1", "leaf 2", "leaf 3", "leaf 4",
                                            "leaf 5", "leaf 6", "leaf 7", "leaf 8", "leaf 9", "leaf 10", "leaf 11",
                                            # "dead leaf", "standing dead", "microbe mat",
                                            "standing dead", "stems"), ], plyr::.(time, species, new.core.id), plyr::summarise,
             g        = sum(g_core, na.rm = T),
             n15      = sum(n15_g, na.rm  = T),
             n_core   = sum(n_core, na.rm = T)
)
abv$g_pg <- abv$n15 / abv$g

names(abv)[4:7] <- paste0(names(abv)[4:7], ".ag")
names(bgd)[4:7] <- paste0(names(bgd)[4:7], ".bg")

comb <- plyr::join_all(list(napp, abv, bgd, mat2), by = "new.core.id")


## ----15N inventories: aboveground, include=FALSE, echo=FALSE-------------

###
### aboveground data
###

### mass over time in aboveground compartments. mean +- se by species (sum across depth intervals)

ag2 <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type2 %in% c("stems", "leaf"), ],
             plyr::.(time, species, new.core.id, sample.type2), plyr::summarise,
             g   = sum(g_core / pot.m2, na.rm  = T),
             n_pct = mean(n_pct, na.rm = TRUE),
             n   = sum(n_core / pot.m2, na.rm  = T),
             n15 = sum(n15_g, na.rm  = T),
             n15_pg = n15 / (g * pot.m2),
             c13 = mean(d13c, na.rm = TRUE),
             cn  = sum(c_pct * g_core, na.rm = TRUE) / n
)

ag2.sp <- plyr::ddply(ag2, plyr::.(time, species, sample.type2), plyr::numcolwise(mean))
ag2.se <- plyr::ddply(ag2, plyr::.(time, species, sample.type2), plyr::numcolwise(se))
names(ag2.se)[4:10] <- paste0(names(ag2.sp)[4:10], ".se")
ag2.sp <- cbind(ag2.sp, ag2.se[, 4:10])
ag2.sp$t <- as.integer(substr(ag2.sp$time, 2, 2))
ag2.sp$session <- unique(ddHgt4$session)[c(1, 3, 5, 7, 9)][as.numeric(as.factor(ag2.sp$time))]
ag2.sp$species2 <- ifelse(ag2.sp$species %in% "SA", "italic(S.~alterniflora)", "italic(D.~spicata)")


###
### belowground data
###

### mass over time in belowground compartments. mean +- se by species (sum across depth intervals)
bg <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("coarse roots", "fine roots", "rhizomes"), ],
            plyr::.(time, species, new.core.id, sample.type), plyr::summarise,
            g   = sum(g_core / pot.m2, na.rm  = T),
            n_pct = mean(n_pct, na.rm = TRUE),
            n   = sum(n_core / pot.m2, na.rm  = T),
            n15 = sum(n15_g, na.rm  = T),
            n15_pg = n15 / (g * pot.m2)
)

bg.sp <- plyr::ddply(bg, plyr::.(time, species, sample.type), plyr::numcolwise(mean))
bg.se <- plyr::ddply(bg, plyr::.(time, species, sample.type), plyr::numcolwise(se))
names(bg.se)[4:8] <- paste0(names(bg.se)[4:8], ".se")
bg.sp <- cbind(bg.sp, bg.se[, 4:8])
bg.sp$t <- as.integer(substr(bg.sp$time, 2, 2))
bg.sp$session <- unique(ddHgt4$session)[c(1, 3, 5, 7, 9)][as.numeric(as.factor(bg.sp$time))]
bg.sp$species2 <- ifelse(bg.sp$species %in% "SA", "italic(S.~alterniflora)", "italic(D.~spicata)")


# Total 15N inventories ---------------------------------------------------------

# aboveground
ag <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("belowground stems", "stems", "leaf", paste0("leaf ", 1:10)), ],
            plyr::.(time, species, new.core.id), plyr::summarise,
            g   = sum(g_core / pot.m2, na.rm  = T),
            n_pct = mean(n_pct, na.rm = TRUE),
            n   = sum(n_core / pot.m2, na.rm  = T),
            n15 = sum(n15_g, na.rm  = T) # g per pot
)

agd1 <- plyr::ddply(ag, plyr::.(time, species), plyr::summarise,
              n15.mean    = mean(n15, na.rm  = T),
              n15.se      = se(n15),
              recovery    = mean(n15 / spike, na.rm = TRUE),
              recovery.se = se(n15 / spike)
)
# species-level belowground inventory over time
bgd <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("coarse roots", "fine roots", "rhizomes"), ], #, "dead biomass"
             plyr::.(time, species, new.core.id), plyr::summarise,
             n15    = sum(n15_g, na.rm  = T)
)
bgd1 <- plyr::ddply(bgd, plyr::.(time, species), plyr::summarise,
              n15.mean    = mean(n15, na.rm  = T),
              n15.se      = se(n15),
              recovery    = mean(n15 / spike, na.rm = TRUE),
              recovery.se = se(n15 / spike)
)

bgd1$type <- "Belowground"
agd1$type <- "Aboveground"
mgd <- rbind(agd1, bgd1)

tot <- plyr::ddply(mat2, plyr::.(time, species), plyr::summarise,
             n15.mean    = mean(n15_2, na.rm  = T),
             n15.se      = se(n15_2),
             recovery    = mean(n15_2 / spike, na.rm = TRUE),
             recovery.se = se(n15_2 / spike)
)
tot$type <- "Total"

# total recovery combined above + belowground (includes dead aboveground but only live belowground)
tot.live <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("coarse roots", "fine roots", "rhizomes",
                                                 "leaf 1", "leaf 2", "leaf 3", "leaf 4",
                                                 "leaf 5", "leaf 6", "leaf 7", "leaf 8", "leaf 9", "leaf 10", "leaf 11",
                                                 "stems"), ], #, "dead biomass"
                  plyr::.(time, species, new.core.id), plyr::summarise,
                  n15    = sum(n15_g, na.rm  = T)
)
tot.live1 <- plyr::ddply(tot.live, plyr::.(time, species), plyr::summarise,
                   n15.mean    = mean(n15, na.rm  = T),
                   n15.se      = se(n15),
                   recovery    = mean(n15 / spike, na.rm = TRUE),
                   recovery.se = se(n15 / spike)
)


mgd <- rbind(mgd, tot)
# replace unique times with actual sampling dates using indexing
mgd$session <- unique(ddHgt4$session)[c(1, 3, 5, 7, 9)][as.numeric(as.factor(mgd$time))]



## ----N uptake rates, include=FALSE, echo=FALSE---------------------------
# N uptake rates ----------------------------------------------------------
# Aboveground: estimate from biomass and weighted average biomass N concentration
# get weighted average of aboveground N concentrations for each core
n_mean <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("belowground stems", "stems", "leaf", paste0("leaf ", 1:10)), ],
                plyr::.(species, time, new.core.id), plyr::summarise,
                tot_mass = sum(g_core / pot.m2, na.rm = TRUE),
                tot_n    = sum(n_core / pot.m2, na.rm = TRUE),
                tot_c    = sum(c_pct * g_core / pot.m2, na.rm = TRUE),
                n_wa = tot_n / tot_mass,
                c_wa = tot_c / tot_mass
)
n_bg_mean <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("fine roots", "coarse roots", "rhizomes"), ],
                   plyr::.(species, time, new.core.id), plyr::summarise,
                   tot_mass_bg = sum(g_core / pot.m2, na.rm = TRUE),
                   tot_n_bg    = sum(n_core / pot.m2, na.rm = TRUE),
                   tot_c_bg    = sum(c_pct * g_core  / pot.m2, na.rm = TRUE),
                   n_wa_bg = tot_n_bg / tot_mass_bg,
                   c_wa_bg = tot_c_bg / tot_mass_bg
)
bg_del <- plyr::ddply(bg, plyr::.(new.core.id), plyr::summarise, # I think all these values are per m2
                g_bg     = sum(g, na.rm = TRUE),
                g_froots = sum(g[sample.type %in% "fine roots"], na.rm = TRUE),
                g_roots  = sum(g[sample.type %in% c("fine roots", "coarse roots")], na.rm = TRUE),
                n_bg     = sum(n, na.rm = TRUE),
                n_pct_bg = mean(n_pct * g, na.rm = TRUE) / g_bg,
                n_pct_bg2 = n_bg / g_bg,
                n15_bg   = sum(n15, na.rm = TRUE)
)

# all relevant values are per m2
master <- plyr::join_all(list(napp[, c("napp.MH", "new.core.id")], # primary production
                        rgr.stems,
                        n_mean[, -c(1)], n_bg_mean[, -c(1:2)], # N inventories above and belowground
                        ag[, 3:7], bg_del # 15N recoveries and unweighted average pct N
), by = "new.core.id")
master$napp.MH  <- master$napp.MH / pot.m2 # g/m2
master$n15_core <- master$n15 + master$n15_bg # total live biomass inventory
master$recovery <- master$n15_core / spike
master$session  <- unique(ddHgt4$session)[c(3, 5, 7, 9)][as.numeric(as.factor(master$time))]

# use master$timeDiff for 15N rate calculations
# use master$timeDiff + 2 for NAPP rate calculations
master$timeDiff <- as.numeric(difftime(master$session, "2016-06-24", units = "days"))

master$n_uptake_15n     <- master$n15 * 1e3 / master$timeDiff / pot.m2 # mg N/day/m2 accumulating in aboveground tissue, using 15N
master$n_uptake_15n_bg  <- master$n15_bg * 1e3 / master$timeDiff /pot.m2 # mg N/day/m2
master$prodn_rate       <- master$napp.MH / (master$timeDiff + 2) # g/m2/day

master$n_uptake_biomass <- master$prodn_rate * 1e3 * master$n_wa # mg N/m2/day accumulating in aboveground tissue, using primary production rate and weighted average pct N
master$cn_ag    <- master$c_wa / master$n_wa # C:N ratio in aboveground tissue
master$cn_bg    <- master$c_wa_bg / master$n_wa_bg
master$cluster  <- ifelse(master$time %in% c("t1", "t2"), "1-2 weeks", "3-4 weeks")
master$n15_pgBG <- (master$n_uptake_15n + master$n_uptake_15n_bg) / master$g_bg # 15N uptake per gram belowground biomass: mg 15N/m2/day/g TOTAL BG biomass
master$n15_pgFR <- (master$n_uptake_15n + master$n_uptake_15n_bg) / master$g_froots # 15N uptake per gram coarse roots: mg 15N/m2/day/g fine roots
master$n15_pgCR <- (master$n_uptake_15n + master$n_uptake_15n_bg) / (master$g_roots - master$g_froots) # 15N uptake per gram coarse roots: mg 15N/m2/day/g coarse roots
master$n15_pgR  <- (master$n_uptake_15n + master$n_uptake_15n_bg) / master$g_roots # 15N uptake per gram fine+coarse root biomass: mg 15N/m2/day/g root biomass
master$n15_pgFR2 <- master$n15_core * 1e3 / master$g_froots
master$tot_15n_uptake <- master$n_uptake_15n + master$n_uptake_15n_bg # mg N/day/m2
master$days <- as.numeric(substr(master$time, 2, 2)) * 7


### apply relationship to estimate belowground production
summary(lm3_4 <- stats::lm(n_uptake_biomass ~ I(n_uptake_15n ) , data = master[master$time %in% c("t3", "t4"), ]))
lm3_4
master$bg_n_est <- as.numeric(master$n_uptake_15n_bg) * coefficients(lm3_4)[2] + coefficients(lm3_4)[1] # total N uptake belowground: mg N/m2/day
master$bg_n_est[master$time %in% c("t1", "t2")] <- NA
master$bgp_est <- master$bg_n_est / master$n_pct_bg2 / 1e3 # [estimated total N uptake (mg N/day)] / [mg N / mg biomass] / [1000 mg/g] = [g belowground biomass / day (/m2)]
master$bgp_biomass_est <- master$bgp_est * master$timeDiff # [g belowground biomass / day] * [timeDiff (days)] = total belowground production during period [g/m2]

### differences in total nitrogen interception between species
master$tot_N_int <- master$bg_n_est + master$n_uptake_biomass + ifelse(master$species %in% "SA", nmolHr_mgDay(dd.dea$flux.m2[2]), nmolHr_mgDay(dd.dea$flux.m2[1]))
master$tot_N_int[master$time %in% c("t1", "t2")] <- NA


dd.master <- ddply(master, .(time, species), numcolwise(mean))
dd.master.se <- ddply(master, .(time, species), numcolwise(se))
dd.master$n_uptake_biomass.se <- dd.master.se$n_uptake_biomass
dd.master$prodn_rate.se <- dd.master.se$prodn_rate
dd.master$session <- unique(ddHgt4$session)[c(3, 5, 7, 9)][as.numeric(as.factor(dd.master$time))]





## ----Results section A, include=FALSE, echo=FALSE------------------------

# Results: a. Stem allometry, aboveground biomass and production ----------
table(allometry$spp[!is.na(allometry$sample)])
plyr::ldply(CSP, MuMIn::r.squaredGLMM)

# change over time in production?
summary(lm.sa.prod <- lm(napp.MH ~ session, data = master[master$species %in% "SA",]))
summary(lm.ds.prod <- lm(napp.MH ~ session, data = master[master$species %in% "DS",]))

plyr::ddply(master, plyr::.(species), plyr::summarise,
      production    = mean(prodn_rate, na.rm = TRUE),
      production.se = se(prodn_rate)
)
t.test(prodn_rate ~ species, data = master)

for (i in 1:length(unique(master$session))) {
  print(unique(master$session)[i])
  print(t.test(prodn_rate ~ species, data = master[(master$session %in% c(unique(master$session)[i])), ]))
}

## ----Results section B, include = FALSE, echo = FALSE--------------------
# Results: b.	Leaf and stem biomass, N pools, and uptake ------------------
# leaf, stem biomass differences
leaf <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("leaf", paste0("leaf ", 1:10)), ],
              plyr::.(species, time, new.core.id), plyr::summarise,
              tot_mass = sum(g_core / pot.m2, na.rm = TRUE),
              tot_n    = sum(n_core / pot.m2, na.rm = TRUE),
              tot_c    = sum(c_pct * g_core / pot.m2, na.rm = TRUE),
              n_wa = tot_n / tot_mass,
              c_wa = tot_c / tot_mass)
leaf$t <- as.numeric(substr(leaf$time, 2, 2)) * 7

stem <- plyr::ddply(CN_mass_data[CN_mass_data$sample.type %in% c("belowground stems", "stems"), ],
              plyr::.(species, time, new.core.id), plyr::summarise,
              tot_mass = sum(g_core / pot.m2, na.rm = TRUE),
              tot_n    = sum(n_core / pot.m2, na.rm = TRUE),
              tot_c    = sum(c_pct * g_core / pot.m2, na.rm = TRUE),
              n_wa = tot_n / tot_mass,
              c_wa = tot_c / tot_mass
)
stem$t <- as.numeric(substr(stem$time, 2, 2)) * 7

leaf2 <- leaf
names(leaf2)[4:8] <- paste0(names(leaf)[4:8], ".leaf")
leaf2 <- cbind(leaf2, stem[4:8])
leaf2$n_wa_ag <- (leaf2$tot_n.leaf + leaf2$tot_n) / (leaf2$tot_mass.leaf + leaf2$tot_mass)

plyr::ddply(leaf[, -c(2, 3)], plyr::.(species), plyr::numcolwise(mean))
plyr::ddply(leaf[, -c(2, 3)], plyr::.(species), plyr::numcolwise(se))

# leaf biomass
summary(lm.sa.leaf <- lm(tot_mass ~ t, data = leaf[leaf$species %in% "SA",]))
summary(lm.ds.leaf <- lm(tot_mass ~ t, data = leaf[leaf$species %in% "DS",]))
t.test(tot_mass ~ species, data = leaf)

# leaf N content
summary(lm.sa.leafN <- lm(n_wa ~ t, data = leaf[leaf$species %in% "SA",]))
summary(lm.ds.leafN <- lm(n_wa ~ t, data = leaf[leaf$species %in% "DS",]))
t.test(n_wa ~ species, data = leaf)


# stems 
plyr::ddply(stem[, -c(2, 3)], plyr::.(species), plyr::numcolwise(mean))
plyr::ddply(stem[, -c(2, 3)], plyr::.(species), plyr::numcolwise(se))

# stem biomass
summary(lm.sa.stem <- lm(tot_mass ~ t, data = stem[stem$species %in% "SA",]))
summary(lm.ds.stem <- lm(tot_mass ~ t, data = stem[stem$species %in% "DS",]))
t.test(tot_mass ~ species, data = stem)

# stem N content
summary(lm.sa.leafN <- lm(n_wa ~ t, data = leaf[leaf$species %in% "SA",]))
summary(lm.ds.leafN <- lm(n_wa ~ t, data = leaf[leaf$species %in% "DS",]))
t.test(n_wa ~ species, data = leaf)

# mean N content for all
plyr::ddply(stem[, -c(2, 3)], plyr::.(), plyr::numcolwise(mean))
plyr::ddply(stem[, -c(2, 3)], plyr::.(), plyr::numcolwise(se))

# stem N stock
t.test(tot_n ~ species, data = stem)


# aboveground weighted average N content
summary(lm.sa.N.ag <- lm(n_wa_ag ~ t, data = leaf2[leaf2$species %in% "SA",]))
summary(lm.ds.N.ag <- lm(n_wa_ag ~ t, data = leaf2[leaf2$species %in% "DS",]))
t.test(n_wa_ag ~ species, data = leaf2)

plyr::ddply(leaf2, plyr::.(species, time), plyr::summarise,
      n_pct = mean(n_wa_ag),
      n_pct.se = se(n_wa_ag))
plyr::ddply(leaf2, plyr::.(species), plyr::summarise,
      n_pct = mean(n_wa_ag),
      n_pct.se = se(n_wa_ag))
plyr::ddply(leaf2, plyr::.(), plyr::summarise,
      n_pct = mean(n_wa_ag),
      n_pct.se = se(n_wa_ag))

### total N uptake (NAPP * %N)
summary(lm.sa.Nupt <- lm(n_uptake_biomass ~ session, data = master[master$species %in% "SA",]))
summary(lm.ds.Nupt <- lm(n_uptake_biomass ~ session, data = master[master$species %in% "DS",]))
t.test(n_uptake_biomass ~ species, data = master) # no difference bt species as a whole

for (i in 1:length(unique(master$session))) {
  print(unique(master$session)[i])
  print(t.test(n_uptake_biomass ~ species, data = master[(master$session %in% c(unique(master$session)[i])), ]))
}
plyr::ddply(master, plyr::.(species), plyr::summarise,
      n_uptake = mean(n_uptake_biomass),
      n_uptake.se = se(n_uptake_biomass))


## ----Results: C: Belowground biomass and N pools, include = FALSE, echo = FALSE----

# Results: c.	Belowground biomass and N pools -----------------------------
# belowground biomass and tissue N
rts <- ddply(CN_mass_data[CN_mass_data$sample.type %in% c("fine roots", "coarse roots", "rhizomes"), ],
             .(species, time, new.core.id, sample.type), summarise,
             tot_mass = sum(g_core / pot.m2, na.rm = TRUE),
             tot_n    = sum(n_core / pot.m2, na.rm = TRUE),
             tot_c    = sum(c_pct * g_core / pot.m2, na.rm = TRUE),
             n_wa = tot_n / tot_mass,
             c_wa = tot_c / tot_mass
)
rts$t <- as.numeric(substr(rts$time, 2, 2)) * 7

ddply(rts[, -c(2, 3)], .(species, sample.type), numcolwise(mean))
ddply(rts[, -c(2, 3)], .(species, sample.type), numcolwise(se))

# fine roots
organ <- "fine roots"
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "SA"), ]))
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "DS"), ]))
t.test(tot_mass ~ species, data = rts[(rts$sample.type %in% organ), ])
t.test(n_wa ~ species, data = rts[(rts$sample.type %in% organ), ])
t.test(tot_n ~ species, data = rts[(rts$sample.type %in% organ), ])

# coarse roots
organ <- "coarse roots"
t.test(tot_mass ~ species, data = rts[(rts$sample.type %in% organ), ])
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "SA"), ]))
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "DS"), ]))

for (i in 1:length(unique(rts$t))) {
  print(unique(rts$t)[i])
  print(t.test(n_wa ~ species, data = rts[(rts$t %in% c(unique(rts$t)[i])) & (rts$sample.type %in% organ), ]))
}

t.test(n_wa ~ species, data = rts[(rts$sample.type %in% organ), ])
t.test(tot_n ~ species, data = rts[(rts$sample.type %in% organ), ])



# rhizomes
organ <- "rhizomes"
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "SA"), ]))
summary(lm(tot_mass ~ t, data = rts[(rts$sample.type %in% organ) & (rts$species %in% "DS"), ]))
t.test(tot_mass ~ species, data = rts[(rts$sample.type %in% organ), ])
t.test(n_wa ~ species, data = rts[(rts$sample.type %in% organ), ])
t.test(tot_n ~ species, data = rts[(rts$sample.type %in% organ), ])



## ----eval=FALSE----------------------------------------------------------
#  install.packages("NitrogenUptake2016")
#  library(NitrogenUptake2016)

## ----eval=FALSE----------------------------------------------------------
#  ?allometry

## ----eval=FALSE----------------------------------------------------------
#  ?stemHeights

## ----eval=FALSE----------------------------------------------------------
#  ?CN_mass_data

## ----eval=FALSE----------------------------------------------------------
#  ?dea

## ----eval=FALSE----------------------------------------------------------
#  vignette(topic = "JEMBE", package = "NitrogenUptake2016")

## ----Figure 1 (Data In Brief), fig.width = 6, fig.height = 4, echo=FALSE----
# Figure 1 from Hill et al. (Data In Brief) - predicted vs obs biomass ---------------------------------------
ggplot(obs, aes(x = allom.est / pot.m2, y = g / pot.m2, colour = species2, shape = species2)) +
  geom_point(size = pointSize) + theme_classic() %+replace% theme(legend.title = element_blank()) +
  labs(x = expression("Predicted biomass (allometry; g"%.%m^-2~")"), y = expression("Measured biomass (g "%.%m^-2~")")) +
  ylim(0, 650) + xlim(0, 650) +
  scale_colour_grey(start = 0.5, end = 0.1, name = "", breaks = c(unique(obs$species2)[1], unique(obs$species2)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  scale_shape_manual(values = c(16, 17), name = "", breaks = c(unique(obs$species2)[1], unique(obs$species2)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  theme(legend.position = c(0.3, 0.9), legend.text.align = 0,
        legend.background = element_rect(fill = NA, colour = NA)) +
  geom_abline(slope = 1, intercept = 0, linetype = 2)

## ----Figure 2 (Data In Brief), fig.width = 6, fig.height = 4, message = FALSE, echo = FALSE----
# Figure 2 in Data In Brief manuscript - aboveground pools ---------------------------------------
ggplot(ag2.sp, aes(y = g, x = as.Date(session), colour = species2, shape = species2)) + geom_point(size = pointSize, position = pd2) + theme_classic() %+replace% theme(legend.title = element_blank()) +
  facet_grid(sample.type2 ~ .) + geom_errorbar(aes(ymin = g - g.se, ymax = g + g.se), width = 0, position = pd2) +
  scale_colour_grey(start = grayColor, end = 0.1, name = "", breaks = c(unique(ag2.sp$species2)[1], unique(ag2.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  scale_shape_manual(values = c(16, 17), name = "", breaks = c(unique(ag2.sp$species2)[1], unique(ag2.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  ylab(expression("Biomass (g "%.%m^-2~")")) +  xlab("") + ylim(0, 325) +
  scale_x_date(breaks = as.Date(unique(ag2.sp$session)), labels = scales::date_format("%b-%d")) +
  theme(legend.position = c(2.2, 0.9), legend.text.align = 0,
        legend.background = element_rect(fill = NA, colour = NA))



ggplot(ag2.sp, aes(y = n_pct, x = as.Date(session), colour = species2, shape = species2)) + geom_point(size = pointSize, position = pd2) + theme_classic() %+replace% theme(legend.title = element_blank()) +
  facet_grid(sample.type2 ~ .) + geom_errorbar(aes(ymin = n_pct - n_pct.se, ymax = n_pct + n_pct.se), width = 0, position = pd2) +
  scale_colour_grey(start = grayColor, end = 0.1, name = "", breaks = c(unique(ag2.sp$species2)[1], unique(ag2.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  scale_shape_manual(values = c(16, 17), name = "", breaks = c(unique(ag2.sp$species2)[1], unique(ag2.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  ylab("Tissue N") +  xlab("") + scale_y_continuous(labels = scales::percent) +
  scale_x_date(breaks = as.Date(unique(ag2.sp$session)), labels = scales::date_format("%b-%d")) +
  theme(legend.position = c(2.2, 0.9), legend.text.align = 0,
        legend.background = element_rect(fill = NA, colour = NA))


## ----Figure 3 (Data In Brief), fig.width = 6, fig.height = 4, echo = FALSE----
# Figure 3 (Data In Brief) - belowground biomass pools --------------------------------------
ggplot(bg.sp, aes(y = g, x = as.Date(session), colour = species2, shape = species2)) + geom_point(size = pointSize, position = pd2) + theme_classic() +
  facet_grid(sample.type ~ .) + geom_errorbar(aes(ymin = g - g.se, ymax = g + g.se), width = 0, position = pd2) +
  scale_colour_grey(start = grayColor, end = 0.1, name = "", breaks = c(unique(bg.sp$species2)[1], unique(bg.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  scale_shape_manual(values = c(16, 17), name = "", breaks = c(unique(bg.sp$species2)[1], unique(bg.sp$species)[2]), labels = c(expression(italic(Distichlis)), expression(italic(Spartina)))) +
  ylab(expression("Biomass (g "%.%m^-2~")")) +  xlab("") +
  scale_x_date(breaks = as.Date(unique(bg.sp$session)), labels = scales::date_format("%b-%d")) +
  theme(legend.text.align = 0, legend.position = c(2.2, 1),
        legend.background = element_rect(fill = NA, colour = NA), axis.text.x=element_text(angle=45,hjust=1))



ggplot(bg.sp, aes(y = n_pct, x = as.Date(session), colour = species2, shape = species2)) + geom_point(size = pointSize, position = pd2) + theme_classic() +
  facet_grid(sample.type ~ .) + geom_errorbar(aes(ymin = n_pct - n_pct.se, ymax = n_pct + n_pct.se), width = 0, position = pd2) +
  scale_colour_grey(start = 0.5, end = 0.1, name = "", breaks = c(unique(bg.sp$species2)[1], unique(bg.sp$species)[2]), labels = c(expression(italic(D.~spicata)), expression(italic(S.~alterniflora)))) +
  scale_x_date(breaks = as.Date(unique(bg.sp$session)), labels = scales::date_format("%b-%d")) +
  ylab("Tissue N content") +  xlab("") + scale_y_continuous(labels = scales::percent) +
  theme(legend.text.align = 0, legend.position = c(2.2, 1),
        legend.background = element_rect(fill = NA, colour = NA), axis.text.x=element_text(angle=45,hjust=1))


