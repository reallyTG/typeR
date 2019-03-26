## ---- message = FALSE, warning = FALSE-----------------------------------
library(pompom)
library(ggplot2)
library(qgraph)
require(reshape2)
set.seed(1234)

## ---- warning = FALSE----------------------------------------------------

n.obs <- 200 # number of observation
p <- 3 # number of variables
noise.level <- 0.1
epsilon <- cbind(rnorm(n.obs,0, noise.level), 
             rnorm(n.obs,0, noise.level), 
             rnorm(n.obs,0, noise.level)) # 3 time-series of noise for 3 variables

true.beta <-  matrix(c(0,0,0,0,0,0,
                       0,0,0,0,0,0,
                       0,0,0,0,0,0,
                       0.2,0,0.25,0,0,0.6, 
                       0,0.3,0,-0.2,0,-0.6, 
                       0,-0.2,0.3,0,0,0), 
                     nrow = 2 * p, 
                     ncol = 2 * p, 
                     byrow = TRUE)

contemporaneous.relations <- matrix(true.beta[(p+1):(2*p),(p+1):(2*p)], nrow = p, ncol = p, byrow = F)
lag.1.relations <- matrix(true.beta[(p+1):(2*p),1:p], nrow = p, ncol = p, byrow = F)


## ---- warning = FALSE----------------------------------------------------
true.beta

## ---- fig.width = 8, fig.height =6---------------------------------------
plot_network_graph(true.beta, p)

## ---- warning = FALSE----------------------------------------------------
time.series <- matrix(rep(0, p * n.obs), nrow = n.obs, ncol = p)
time.series[1,] <- rnorm(p,0,1)

row <- p
for (row in 2:n.obs)
{
  time.series[row,] <- solve(diag(1,p, p) - contemporaneous.relations) %*%
    lag.1.relations %*% time.series[row-1,] +
    solve(diag(1,p, p) - contemporaneous.relations) %*% epsilon[row, ]
}
time.series <- data.frame(time.series)
names(time.series) <- c("x", "y", "z")

## ---- fig.width = 8, fig.height =6---------------------------------------
time.series$time <- seq(1,length(time.series[,1]),1)

time.series.long <- melt(time.series, id="time")  ## convert to long format

ggplot(data=time.series.long,
       aes(x=time, y=value, colour=variable)) +
  geom_line() + 
  facet_wrap( ~ variable  ,  ncol = 1) +
  scale_y_continuous(breaks = seq(0, 100, by = 50)) + 
  theme(
    strip.background = element_blank(),
    panel.background = element_blank(),
    legend.title =   element_blank(),
    
    # strip.text.x = element_blank(),
    # strip.text.y = element_blank(),
    # axis.text.y = element_text(),
    # axis.title.y = element_blank()
    
    legend.key = element_blank(),
    legend.position = "none",
    # legend.title =   element_blank(),
    # panel.background = element_blank(),
    axis.text.y=element_text(color="black",size=12),
    axis.text.x=element_text(color="black",size=12),
    axis.title.y=element_text(color="black",size=12),
    axis.title.x=element_text(color="black",size=12),
    axis.line = element_line(color = 'black')
                                 
    )+
  ylim(-1,1)+
  xlab("Time") +
  ylab("Value")

  
time.series$time <- NULL

## ---- fig.width = 8, fig.height =6---------------------------------------
var.number <- p # number of variables
lag.order <- 1 # lag order of the model

model.fit <- uSEM(var.number, 
                  time.series,
                  lag.order, 
                  verbose = FALSE, 
                  trim = TRUE)


## ---- fig.width = 8, fig.height =6---------------------------------------
beta.matrix <- parse_beta(var.number = p, 
                          model.fit = model.fit, 
                          lag.order = 1, 
                          matrix = TRUE) # parse temporal relations in matrix format

plot_network_graph(beta.matrix$est, 
                   var.number)


## ---- warning = FALSE----------------------------------------------------
beta.matrix$est
beta.matrix$se

## ------------------------------------------------------------------------
mdl <- model_summary(model.fit, 
                     var.number, 
                     lag.order)

mdl$beta
mdl$beta.se
mdl$psi

## ------------------------------------------------------------------------
mdl$cfi
mdl$tli
mdl$rmsea
mdl$srmr

## ---- warning = FALSE----------------------------------------------------
steps <- 100 # number of steps to generate time profile 
replication <- 200 # number of repilcations in bootstrap 
threshold <- .01 # setting threshold for approximate asymptote (iRAM calculation)

## ---- fig.width = 8, fig.height =6, warning = F--------------------------
# ponit estimate of iRAM 
point.estimate.iRAM <- iRAM(model.fit, 
                            beta = NULL, 
                            var.number = var.number, 
                            lag.order = lag.order, 
                            threshold = threshold,
                            boot = FALSE, 
                            replication = replication,
                            steps= steps)

point.estimate.iRAM$recovery.time 
# point.estimate.iRAM$time.series.data

## ---- fig.width = 8, fig.height =6, warning = F--------------------------
plot_time_profile(point.estimate.iRAM$time.series.data, 
                  var.number = 3,
                  threshold = threshold, 
                  xupper = 50)

## ---- warning = FALSE----------------------------------------------------

bootstrap.iRAM <- iRAM(model.fit, 
                       beta = NULL, 
                       var.number = var.number, 
                       lag.order = lag.order,
                       threshold = threshold,
                       boot = TRUE, 
                       replication = replication,
                       steps= steps
                       )

bootstrap.iRAM$mean
bootstrap.iRAM$upper
bootstrap.iRAM$lower

## ---- fig.width = 8, fig.height =6, warning = F--------------------------
plot_time_profile(bootstrap.iRAM$time.profile.data, 
                  var.number = 3,
                  threshold = threshold, 
                  xupper = 25)


## ---- fig.width = 8, fig.height =6, warning = F--------------------------
plot_iRAM_dist(bootstrap.iRAM$recovery.time.reps)

## ---- warning = FALSE, fig.width = 8, fig.height =6----------------------
true.iRAM <- iRAM(
  model.fit= NULL,
  beta = true.beta, 
  var.number = var.number, 
  lag.order = lag.order, 
  threshold = threshold,
  boot = FALSE, 
  replication = replication,
  steps= steps)


plot_time_profile(true.iRAM$time.series.data, 
                  var.number = 3,
                  threshold = threshold, 
                  xupper = 25)


## ------------------------------------------------------------------------

sum.diff <- 0
for (row in 1:nrow(bootstrap.iRAM$recovery.time))
{
  sum.diff <- sum.diff + (bootstrap.iRAM$recovery.time.reps[row,] -
    c(true.iRAM$recovery.time[1,], 
      true.iRAM$recovery.time[2,], 
      true.iRAM$recovery.time[3,]))^2
}
RMSE <- sqrt(sum.diff/nrow(bootstrap.iRAM$recovery.time))


sum.diff <- 0
for (row in 1:nrow(bootstrap.iRAM$recovery.time))
{
  sum.diff <- sum.diff + (bootstrap.iRAM$recovery.time.reps[row,] -
    c(true.iRAM$recovery.time[1,], 
      true.iRAM$recovery.time[2,], 
      true.iRAM$recovery.time[3,]))/
    (c(true.iRAM$recovery.time[1,], 
      true.iRAM$recovery.time[2,], 
      true.iRAM$recovery.time[3,]))
}
RB <- 1/nrow(bootstrap.iRAM$recovery.time) * sum.diff

SD <- NULL
for (col in 1:(var.number^2))
{
  SD <- cbind(SD, sd(bootstrap.iRAM$recovery.time.reps[,col]))
}

  

## ------------------------------------------------------------------------
# metrics
true.iRAM$recovery.time # true value
bootstrap.iRAM$mean # estimated mean
RMSE
RB
SD 

## ---- fig.width = 8, fig.height =6, warning = F--------------------------
iRAM_equilibrium_value <- iRAM_equilibrium(beta = mdl$beta,
                         var.number = var.number, 
                         lag.order = lag.order)

iRAM_equilibrium_value

## ---- fig.width = 8, fig.height =6, warning = F--------------------------
plot_integrated_time_profile(beta.matrix = mdl$beta, 
                             var.number = 3, 
                             lag.order = 1)

