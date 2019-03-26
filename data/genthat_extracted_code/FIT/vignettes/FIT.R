## ---- eval=FALSE---------------------------------------------------------
#  install.packages('FIT')

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("FIT", INSTALL_opts = "--no-multiarch")

## ----chunk-weather-data, eval=TRUE---------------------------------------
train.weather.file <- system.file('extdata', 'train.weather', package='FIT')
load(train.weather.file)
head(weather)

## ------------------------------------------------------------------------
weather.start.date <- as.POSIXct("2008-05-01")

## ----chunk-sampling, eval=TRUE-------------------------------------------
transplant.date <- as.POSIXct("2008-06-01")

sampling.date <- c(
  as.POSIXct("2008-06-12") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-06-19") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-06-26") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-07-03") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-07-10") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-07-17") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-07-24") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-07-31") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-08-07") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-08-14") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-08-21") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-08-28") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-09-04") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-09-11") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours"), 
  as.POSIXct("2008-09-18") + as.difftime(rep(seq(0, 20, 4), each=2), unit="hours")
)
sampling.time <- as.numeric(sampling.date - weather.start.date, unit="mins")

## ----chunk-mean, eval=TRUE-----------------------------------------------
sample.n <- length(sampling.time)
mean.expression <- matrix(c(5, 5, 5, 4, 7), sample.n, 5, byrow = T)

# gene 1
mean.expression[, 1] <- mean.expression[, 1] + cos(2*pi * sampling.time/60/24)

# gene 2
for(i in 1:sample.n){
  env.input <- weather$temperature[sampling.time[i]-60*3<weather$time & weather$time<=sampling.time[i]] - 20
  mean.expression[i, 2] <- mean.expression[i, 2] + mean(env.input > 0)
}

# gene 3
for(i in 1:sample.n){
  env.input <- weather$temperature[sampling.time[i]-60*3<weather$time & weather$time<=sampling.time[i]] - 25
  mean.expression[i, 3] <- mean.expression[i, 3] + 0.1 * mean((env.input > 0) * env.input)
}
mean.expression[, 3] <- mean.expression[, 3] + 0.5 * cos(2*pi * (sampling.time/60 - 6)/24)

# gene 4
for(i in 1:sample.n){
  env.input <- weather$temperature[sampling.time[i]-60*6<weather$time & weather$time<=sampling.time[i]] - 20
  mean.expression[i, 4] <- mean.expression[i, 4] + mean(env.input > 0)
}
mean.expression[, 4] <- mean.expression[, 4] + 0.5 * cos(2*pi * (sampling.time/60 - 12)/24)
mean.expression[, 4] <- mean.expression[, 4] + 0.01 * floor(as.numeric(sampling.date - transplant.date, unit="days"))

# gene 5
for(i in 1:sample.n){
  env.input <- weather$temperature[sampling.time[i]-60*6<weather$time & weather$time<=sampling.time[i]] - 25
  mean.expression[i, 5] <- mean.expression[i, 5] + 0.1 * mean((env.input < 0) * env.input)
}
mean.expression[, 5] <- mean.expression[, 5] + 0.5 * cos(2*pi * (sampling.time/60 - 18)/24)
mean.expression[, 5] <- mean.expression[, 5] - 0.05 * floor(as.numeric(sampling.date - transplant.date, unit="days"))

mean.expression <- exp(mean.expression)

## ----chunk-dispersion, eval=TRUE-----------------------------------------
dispersion <- 2 / colMeans(mean.expression)

## ----chunk-count, eval=TRUE----------------------------------------------
cnt <- matrix(0, sample.n, 5)
for(i in 1:5){
  for(j in 1:sample.n){
    cnt[j,i] <- rnbinom(1, size=1/dispersion[i], mu=mean.expression[j,i])
  }
}
genes <- sprintf("gene%d", 1:5)
colnames(cnt) <- genes

## ----chunk-log-cpm, eval=TRUE--------------------------------------------
mean.expression.constant <- exp(rnorm(10000)+5)
cnt.constant <- sapply(mean.expression.constant, function(mu) rnbinom(sample.n, mu/2, mu=mu))
genes.constant <- sprintf("gene-constant%d", 1:10000)
colnames(cnt.constant) <- genes.constant
log.cpm <- t(apply(cbind(cnt, cnt.constant), 1, function(row) log2((row+0.5) / sum(row+1) * 10^6)))

## ----chunk-weight, eval=TRUE---------------------------------------------
log.count.mean <- colMeans(log.cpm) + mean(log2(rowSums(cnt))) - 6*log2(10)
spline.fit <- apply(log.cpm, 2, function(col) stats::predict(smooth.spline(sampling.time, col), sampling.time)$y)
# residual standard deviations
res.std <- sqrt(colSums((log.cpm - spline.fit)**2) / sample.n)

# LOWESS reqression
lo <- lowess(log.count.mean, sqrt(res.std))
lo.fun <- approxfun(c(-6*log2(10), lo$x[lo$y>min(sqrt(res.std))], Inf), c(max(sqrt(res.std)), lo$y[lo$y>min(sqrt(res.std))], min(sqrt(res.std))))

R <- log2(rowSums(cnt) + 1)
weight <- apply(
  spline.fit, 2, 
  function(f) 
    1 / (lo.fun(f + R - 6*log2(10))**4)
)
colnames(weight) <- c(genes, genes.constant)

## ----chunk-attribute, eval=TRUE------------------------------------------
attribute <- data.frame(
  time = as.numeric(sampling.date - weather.start.date, unit="mins"),
  year = as.POSIXlt(sampling.date)$year + 1900,
  month = as.POSIXlt(sampling.date)$mon + 1,
  day = as.POSIXlt(sampling.date)$mday,
  hour = as.POSIXlt(sampling.date)$hour,
  min = as.POSIXlt(sampling.date)$min,
  age = floor(as.numeric(sampling.date - transplant.date, unit="days")),
  type = 1
)

## ----chunk-load, eval=TRUE-----------------------------------------------
requireNamespace('FIT')

## ----chunk-train-data, eval=TRUE-----------------------------------------
train.attribute  <- FIT::convert.attribute(attribute)
train.weather    <- FIT::convert.weather(weather, "temperature")
train.expression <- FIT::convert.expression(log.cpm, genes)

## ----chunk-train-weight, eval=TRUE---------------------------------------
train.weight     <- FIT::convert.weight(weight, genes)

## ----chunk-grid, eval=TRUE-----------------------------------------------
grid.coords <- list(
  env.temperature.threshold = c(10, 15, 20, 25, 30),
  env.temperature.amplitude = c(-100/30, -1/30, 1/30, 100/30),
  env.temperature.period = c(10, 30, 90, 270, 720, 1440, 1440*3),
  gate.temperature.phase = seq(0, 23*60, 1*60),
  gate.temperature.threshold = cos(pi*seq(8,24,4)/24),
  gate.temperature.amplitude = c(-5, 5)
)

## ----chunk-recipe, eval=TRUE---------------------------------------------
recipe <- FIT::make.recipe('temperature', 
                           init = 'gridsearch',
                           optim = c('lm'),
                           fit = 'fit.lasso',
                           init.data = grid.coords,
                           time.step = 10, 
                           gate.open.min = 360)

## ----chunk-train, eval=TRUE----------------------------------------------
models <- FIT::train(train.expression,
                     train.attribute,
                     train.weather,
                     recipe,
                     train.weight)

## ---- eval=TRUE----------------------------------------------------------
models <- unlist(models)

## ----chunk-predict, eval=TRUE--------------------------------------------
prediction.attribute.file <- system.file('extdata', 'prediction.attribute', package = 'FIT')
prediction.weather.file <- system.file('extdata', 'prediction.weather', package = 'FIT')

prediction.attribute  <- FIT::load.attribute(prediction.attribute.file);
prediction.weather    <- FIT::load.weather(prediction.weather.file, 'weather', "temperature")
prediction <- FIT::predict(models, prediction.attribute, prediction.weather)

## ----chunk-error, fig.height=2, eval=TRUE--------------------------------
prediction.expression.file <- system.file('extdata', 'prediction.expression', package = 'FIT')

prediction.expression <- FIT::load.expression(prediction.expression.file, 'log.cpm', genes)
prediction.errors <- FIT::prediction.errors(models,
                                           prediction.expression,
                                           prediction.attribute,
                                           prediction.weather)

## ----chunk-plot, fig.height=4, eval=TRUE---------------------------------
for(i in 1:length(prediction)){
  plot(prediction[[i]], prediction.expression$rawdata[,i], 
      xlab='prediction', ylab='observation')
  title(models[[i]]$gene)
}

## ---- eval=TRUE----------------------------------------------------------
models[[1]]$coefs

## ---- eval=TRUE----------------------------------------------------------
models[[1]]$params

## ----chunk-load2, eval=TRUE----------------------------------------------
train.expression2 <- FIT::convert.expression(log.cpm, genes[-5])
train.weight2     <- FIT::convert.weight(weight, genes[-5])

## ----chunk-recipe2, eval=TRUE--------------------------------------------
init.params <- rep(list(models[[1]]$params), 4)
names(init.params) <- genes[-5]
recipe2 <- FIT::make.recipe(models[[1]]$env, 
                           init = 'manual',
                           optim = c('lm'),
                           fit = 'fit.lasso',
                           init.data = list(
                             params = init.params,
                             response.type = models[[1]]$response.type,
                             input.mean = models[[1]]$input.mean,
                             input.sd = models[[1]]$input.sd
                             ),
                           time.step = 10, 
                           gate.open.min = 360)

## ----chunk-example2, fig.height=4, eval=TRUE-----------------------------
models2 <- unlist(FIT::train(train.expression2,
                             train.attribute,
                             train.weather,
                             recipe2, 
                             train.weight2))
prediction2 <- FIT::predict(models2, prediction.attribute, prediction.weather)

for(i in 1:4){
  plot(prediction2[[i]], prediction.expression$rawdata[,i], 
      xlab='prediction', ylab='observation')
  title(models2[[i]]$gene)
}

