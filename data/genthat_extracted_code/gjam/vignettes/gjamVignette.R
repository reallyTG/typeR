## ----outform, echo=F-----------------------------------------------------
insertPlot <- function(file, caption){
#    outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
#  if(outputFormat == 'latex')
#    paste("![ ", caption, " ](", file, ")",sep="")
}
bigskip <- function(){
#  outputFormat = knitr::opts_knit$get("rmarkdown.pandoc.to")
#  if(outputFormat == 'latex')
#    "\\bigskip"
#  else
    "<br>"
}

## ----fig1, fig.width = 5.9, fig.height = 4, echo = FALSE-----------------

  sig    <- .9
  mu     <- 3.1
  offset <- -2
  
  par(mfrow = c(1, 2), bty = 'n', mar = c(4, 5, 3, .1), cex=1.2, family='serif')
  part <- c(0, 2.2, 3.3, 4.5, 6.6)
  w    <- seq(-1, 7, length = 1000)
  dw   <- dnorm(w, mu, sig)
  dp   <- dw[ findInterval(part, w) ]
  pw   <- pnorm(part, mu, sig)
  pw[-1] <- diff(pw)
  
  plot(w, 2*dw - .5, type = 'l', ylim = c(-.5, 4), yaxt = 'n', 
       ylab = expression(paste(italic(y), '|', italic(w), ', ', bold(p), 
                               sep = '')), 
       xlab = expression(paste(italic(w), '|', bold(x), ', ', bold(beta), 
                              ', ', bold(Sigma), sep = '')), 
       xlim = c(offset, 7), lwd = 2)
  axis(2, at = c(0:5))
  
  db <- .15
  int <- 4
  
  polygon( c(w, rev(w)), 2*c(dw, w*0) - .5, col = 'grey', lwd = 2)
  lines(c(-1, part[1]), c(0, 0), lwd = 2)
  
  for(j in 1:(length(part))){
    
    lines( part[j:(j+1)], c(j, j), lwd = 3)
    ww <- which(w >= part[j] & w <= part[j+1])
    
    if(j == 3){
      w1 <- ww[1]
      w2 <- max(ww)
      arrows( mean(w[ww]), 2*max(dw[ww]) - .4, mean(w[ww]), 
              j - .4, angle = 20, lwd = 5, col = 'grey', length = .2)
      arrows( w[w1] - .5 , j , -.7, j , angle = 20, 
              lwd = 5, col = 'grey', length = .2)
      text( c(w[w1], w[w2]), c(3.3, 3.3), 
            expression(italic(p)[4], italic(p)[5]), cex=.9)
      text( w[w2] + .3, .6, expression( italic(w)[italic(is)] ))
      text( 0, 3.5, expression( italic(y)[italic(is)] ))
    }
    
    coll <- 'white'
    if(j == int)coll <- 'grey'
    rect( offset, j - 1 - db, 2*pw[j] + offset, j - 1 + db, 
          col = coll, border = 'black', lwd = 2)
  }
  
  ww <- which(w >= part[int - 1] & w <= part[int])
  abline(h = -.5, lwd = 2)
  
  title('a) Data generation', adj = 0, font.main = 1, font.lab = 1, cex=.8)
  
  plot(w, 2*dw - .5, type = 'l', ylim = c(-.5, 4), yaxt = 'n', 
       ylab = expression(italic(y)), 
       xlab = expression(paste(italic(w), '|', italic(y), ', ', bold(p), sep = '')), 
       xlim = c(offset, 7), lwd = 2, col = 'grey')
  axis(2, at = c(0:5))
  
  abline(h = -.5, lwd = 2, col = 'grey')
  
  wseq <- c(-10,part)
  for(j in 1:(length(part))){
    
    coll <- 'white'
    border <- 'grey'
    
    if(j == int){
      coll <- 'grey'
      border <- 'black'
      rect( offset, j - 1 - db, 2*pw[j] + offset, j - 1 + db, 
            col = 'black', border = 'black')
    }
    lines( part[j:(j+1)], c(j, j), lwd = 3)
    lines(part[c(j, j)], 2*c(0, dp[j])-.5, col = 'grey')
  }
  
  lines(c(-1, part[1]), c(0, 0), lwd = 2)
  ww <- which(w >= part[int - 1] & w <= part[int])
  polygon( w[c(ww, rev(ww))], 2*c(dw[ww], ww*0) - .5, col = 'grey', lwd = 2)
  
  arrows( mean(w[ww]),  int - 1.3, mean(w[ww]),  2*max(dw) - .5, 
          angle = 20, lwd = 5, col = 'grey', length = .2)
  arrows( -.5,  int - 1, min(w[ww]) - .4, int - 1, angle = 20, 
          lwd = 5, col = 'grey', length = .2)
  
  title('b) Inference', adj = 0, font.main = 1, font.lab = 1, cex=.8)

## ----simulate CA, eval = F-----------------------------------------------
#  library(gjam)
#  f <- gjamSimData(n = 500, S = 10, Q = 4, typeNames = 'CA')
#  summary(f)

## ----show formula, eval = F----------------------------------------------
#  f$formula

## ----plotSimY, fig.show = "hold", fig.width = 6.5, eval = F--------------
#  par(bty = 'n', mfrow = c(1,2), family='')
#  h <- hist(c(-1,f$y),nclass = 50,plot = F)
#  plot(h$counts,h$mids,type = 's')
#  plot(f$w,f$y,cex = .2)

## ----fit CA data, eval = F-----------------------------------------------
#  ml  <- list(ng = 1000, burnin = 100, typeNames = f$typeNames)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  summary(out)

## ----printG, eval=F------------------------------------------------------
#  print(out)

## ----summary of chains, eval = F-----------------------------------------
#  summary(out$chains)

## ----summary of fitted model, eval = FALSE-------------------------------
#  summary(out$inputs)

## ----show classes, eval = F----------------------------------------------
#  out$inputs$classBySpec

## ----betaMu, eval=F------------------------------------------------------
#  out$parameters$betaMu

## ----betaAll, eval=F-----------------------------------------------------
#  out$parameters$betaMu         # S by M coefficient matrix alpha
#  out$parameters$betaStandXmu   # S by M standardized for X
#  out$parameters$betaStandXWmu  # (S-F) by M standardized for W/X, centered factors
#  
#  out$parameters$betaTable        # SM by stats posterior summary
#  out$parameters$betaStandXtable  # SM by stats posterior summary
#  out$parameters$betaStandXWtable # (S-F)M by stats posterior summary
#  
#  out$parameters$sigMu         # S by S covariance matrix omega
#  out$parameters$sigSe         # S by S covariance std errors

## ----plot CA data, family='', eval = FALSE-------------------------------
#  f   <- gjamSimData(n = 500, S = 10, typeNames = 'CA')
#  ml  <- list(ng = 1000, burnin = 200, typeNames = f$typeNames)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  pl  <- list(trueValues = f$trueValues, GRIDPLOTS = T)
#  gjamPlot(output = out, plotPars = pl)

## ----example output, fig.show = "hold", fig.width = 6.5, eval = F--------
#  par(bty = 'n', mfrow = c(1,3), family='')
#  plot(f$trueValues$beta, out$parameters$betaMu, cex = .2)
#  plot(f$trueValues$corSpec, out$parameters$corMu, cex = .2)
#  plot(f$y,out$prediction$ypredMu, cex = .2)

## ----design1, eval = F---------------------------------------------------
#  library(repmis)
#  d <- "https://github.com/jimclarkatduke/gjam/blob/master/forestTraits.RData?raw=True"
#  source_data(d)
#  xdata <- forestTraits$xdata[,c(1,2,8)]

## ----setupX, echo=F, eval=T----------------------------------------------
temp <- c(1.22,  0.18, -0.94,  0.64,  0.82)
deficit <- c(0.04,  0.21,  0.20,  0.82, -0.18)
soil <- c('reference', 'reference', 'SpodHist',  'reference', 'reference')
xx <- data.frame( temp, deficit, soil )
attr(xx$soil,'levels') <- c("reference","SpodHist","EntVert","Mol","UltKan")

## ----design1.2, eval = F-------------------------------------------------
#  xdata[1:5,]

## ----design2, eval = T---------------------------------------------------
formula <- as.formula( ~ temp + deficit + soil )

## ----design3, echo=F-----------------------------------------------------
  tmp <- model.frame(formula,data=xx)
  x   <- model.matrix(formula, data=tmp)
  x[1:5,]

## ----design4, eval = T---------------------------------------------------
formula <- as.formula( ~ temp*soil )

## ----design5, echo = F---------------------------------------------------
tmp <- model.frame(formula,data=xx,na.action=NULL)
x   <- model.matrix(formula, data=tmp)
x[1:5,]

## ----design6, eval = T---------------------------------------------------
formula <- as.formula( ~ temp + I(temp^2) + deficit )

## ----design7, echo = F---------------------------------------------------
tmp <- model.frame(formula,data=xx,na.action=NULL)
x   <- model.matrix(formula, data=tmp)
x[1:5,]

## ----design8, eval = T---------------------------------------------------
formula <- as.formula( ~ temp*deficit + I(temp^2) + I(deficit^2) )

## ----design9, echo = F---------------------------------------------------
tmp <- model.frame(formula,data=xx,na.action=NULL)
x   <- model.matrix(formula, data=tmp)
x[1:5,]

## ----get trees, eval = F-------------------------------------------------
#  y  <- gjamReZero(forestTraits$treesDeZero)  # extract y
#  treeYdata  <- gjamTrimY(y,10)$y             # at least 10 plots
#  dim(treeYdata)
#  treeYdata[1:5,1:6]

## ----fit trees, eval = F-------------------------------------------------
#  rl   <- list(r = 8, N = 20)
#  ml   <- list(ng = 2500, burnin = 500, typeNames = 'DA', reductList = rl)
#  form <- as.formula( ~ temp*deficit + I(temp^2) + I(deficit^2) )
#  out  <- gjam(form, xdata = xdata, ydata = treeYdata, modelList = ml)
#  specNames <- colnames(treeYdata)
#  specColor <- rep('black',ncol(treeYdata))
#  specColor[ c(grep('quer',specNames),grep('cary',specNames)) ] <- 'brown'
#  specColor[ c(grep('acer',specNames),grep('frax',specNames)) ] <- 'darkgreen'
#  specColor[ c(grep('abie',specNames),grep('pice',specNames)) ] <- 'blue'
#  
#  pl   <- list(GRIDPLOTS=T, specColor = specColor)
#  gjamPlot(output = out, plotPars = pl)

## ----gsens, eval = F-----------------------------------------------------
#  types <- c('DA','DA','OC','OC','OC','OC','CC','CC','CC','CC','CC','CA','CA','PA','PA')
#  f    <- gjamSimData(S = length(types), typeNames = types)
#  ml   <- list(ng = 500, burnin = 50, typeNames = f$typeNames)
#  out  <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  
#  ynames <- colnames(f$y)
#  group  <- ynames[types == 'CC']
#  
#  full <- gjamSensitivity(out)
#  cc   <- gjamSensitivity(out, group)
#  ylim <- range( c(full, cc) )
#  
#  nt <- ncol(full)
#  
#  boxplot( full, boxwex = 0.2,  at = 1:nt - .15, col='blue', log='y',
#           ylim = ylim, xaxt = 'n', xlab = 'Predictors', ylab='Sensitivity')
#  boxplot( cc, boxwex = 0.2, at = 1:nt + .15, col='forestgreen', add=T,
#           xaxt = 'n')
#  axis(1,at=1:nt,labels=colnames(full))
#  legend('bottomright',c('full response','CC data'),
#         text.col=c('blue','forestgreen'))

## ----sens2, eval=F-------------------------------------------------------
#  group  <- ynames[types == 'CA']
#  ca   <- gjamSensitivity(out, group)
#  
#  ylim <- range( rbind(cc,ca) )
#  
#  nt <- ncol(full)
#  
#  boxplot( ca, boxwex = 0.2,  at = 1:nt - .15, col='blue', log='y',
#           xaxt = 'n', ylim = ylim, xlab = 'Predictors', ylab='Sensitivity')
#  boxplot( cc, boxwex = 0.2, at = 1:nt + .15, col='forestgreen', add=T,
#           xaxt = 'n')
#  axis(1,at=1:nt,labels=colnames(full))
#  legend('bottomright',c('CA data','CC data'),
#         text.col=c('blue','forestgreen'))

## ----plot save, eval = F-------------------------------------------------
#  plotPars <- list(GRIDPLOTS=T, SAVEPLOTS = T, outfolder = 'plots')

## ----effort simulation, eval = F-----------------------------------------
#  S  <- 5
#  n  <- 50
#  ef <- list( columns = 1:S, values = round(runif(n,.5,5),1) )
#  f  <- gjamSimData(n, S, typeNames = 'DA', effort = ef)
#  ef

## ----w vs y, bty = 'n', fig.width = 6.5, eval = F------------------------
#  plot(f$w,f$y, cex = .2)

## ----including effort, bty = 'n', fig.width = 6.5, eval = F--------------
#  plot(f$w*ef$values, f$y, cex = .2)

## ----fitting, eval = F---------------------------------------------------
#  S   <- 10
#  n   <- 1500
#  ef  <- list( columns = 1:S, values = round(runif(n,.5,5),1) )
#  f   <- gjamSimData(n, S, typeNames = 'DA', effort = ef)
#  ml  <- list(ng = 1000, burnin = 250, typeNames = f$typeNames, effort = ef)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  pl  <- list(trueValues = f$trueValues, SMALLPLOTS=F)
#  gjamPlot(output = out, plotPars = pl)

## ----censUp, eval=F------------------------------------------------------
#  # assumes there is a data matrix ydata
#  upper <- 100
#  intv  <- matrix(c(upper,Inf),2)
#  rownames(intv) <- c('lower','upper')
#  tmp <- gjamCensorY(values = upper, intervals = intv, y = f$ydata, type='DA')

## ----lowerLim, eval=F----------------------------------------------------
#  miny   <- apply(f$ydata, 2, min, na.rm=T)     #minimum value by column
#  censor <-  numeric(0)
#  p      <- matrix(0, 3, dimnames=list(c("values","lower","upper"), NULL))
#  
#  for(j in 1:ncol(f$ydata)){
#    p[1:3] <- c(miny[j], -Inf, miny[j])
#    jlist  <- list("columns" = j, "partition" = p)
#    censor <- c(censor, list(jlist))
#    names(censor)[j] <- 'CA'
#  }

## ----betaPrior, eval = F-------------------------------------------------
#  xdata   <- forestTraits$xdata
#  formula <- as.formula(~ temp*deficit)
#  snames  <- colnames(treeYdata)
#  
#  # warm winter
#  hot <- c("liquStyr","liriTuli","pinuEchi","pinuElli","pinuPalu","pinuTaed",
#           "querImbr","querLaur","querLyra","querMich","querMueh","querNigr",
#           "querPhel","querVirg")  # arbitrary spp, positive winter temp
#  nh <- length(hot)
#  lo  <- vector('list', nh)
#  names(lo) <- paste('temp',hot,sep='_')
#  for(j in 1:nh)lo[[j]] <- 0
#  
#  # humid climate (negative deficit)
#  humid <- c("abieBals", "betuAlle", "querNigr", "querPhel")  #again, arbitrary
#  nh <- length(humid)
#  hi  <- vector('list', nh)
#  names(hi) <- paste('deficit',humid,sep='_')
#  for(j in 1:nh)hi[[j]] <- 0
#  
#  bp <- gjamPriorTemplate(formula, xdata, ydata = treeYdata, lo = lo, hi=hi)
#  rl <- list(N = 10, r = 5)
#  ml <- list(ng=1000, burnin=200, typeNames = 'CA', betaPrior = bp, reductList=rl)
#  out <- gjam(formula, xdata, ydata = treeYdata, modelList = ml)
#  
#  sc  <- rep('grey',ncol(treeYdata))
#  sc[snames %in% hot] <- 'orange'      # highlight informative priors
#  sc[snames %in% humid] <- 'blue'
#  pl  <- list(specColor=sc)
#  gjamPlot(output = out, plotPars = pl)

## ----compData, eval = FALSE----------------------------------------------
#  f   <- gjamSimData(S = 8, typeNames = 'CC')
#  ml  <- list(ng = 2000, burnin = 500, typeNames = f$typeNames)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  pl  <- list(trueValues = f$trueValues, SMALLPLOTS = F)
#  gjamPlot(output = out, plotPars = pl)

## ----compFC, eval = FALSE------------------------------------------------
#  f   <- gjamSimData(S = 20, typeNames = 'FC')
#  ml  <- list(ng = 2000, burnin = 500, typeNames = f$typeNames)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  pl  <- list(trueValues = f$trueValues, SMALLPLOTS = F)
#  gjamPlot(output = out, plotPars = pl)

## ----ordinal, eval = FALSE-----------------------------------------------
#  f   <- gjamSimData(typeNames = 'OC')
#  ml  <- list(ng = 2000, burnin = 500, typeNames = f$typeNames)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  print(out)

## ----ordinal partition, eval = FALSE-------------------------------------
#  keep <- strsplit(colnames(out$parameters$cutMu),'C-') #only saved columns
#  keep <- matrix(as.numeric(unlist(keep)), ncol = 2, byrow = T)[,2]
#  plot(f$trueValues$cuts[,keep],out$parameters$cutMu)

## ----ordPlots, eval = FALSE----------------------------------------------
#  pl  <- list(trueValues = f$trueValues)
#  gjamPlot(output = out, plotPars = pl)

## ----cat, eval = T, echo = F---------------------------------------------
leaf  <- c('bd', 'nd', 'be', 'other')
xylem <- c('dp', 'rp', 'other') 
np    <- 7
xx <- data.frame( leaf = factor(sample(leaf,np,replace=T)),
            xylem = factor(sample(xylem,np,replace=T) ))
xx

## ----catY, eval = T, echo = F--------------------------------------------
wl <- match(xx$leaf,leaf)
wx <- match(xx$xylem,xylem)
ml <- matrix(0,np,4)
ml[cbind(1:np,wl)] <- 1
colnames(ml) <- paste('leaf',leaf,sep='_')
mx <- matrix(0,np,3)
mx[cbind(1:np,wx)] <- 1
colnames(mx) <- paste('xylem',xylem,sep='_')
cbind(ml,mx)

## ----cat2, eval = FALSE--------------------------------------------------
#  types <- c('CAT','CAT')
#  f     <- gjamSimData(n=2000, S = length(types), typeNames = types)
#  ml    <- list(ng = 1500, burnin = 500, typeNames = f$typeNames, PREDICTX = F)
#  out   <- gjam( f$formula, xdata = f$xdata, ydata = f$ydata, modelList = ml )
#  pl    <- list(trueValues = f$trueValues, PLOTALLY = T)
#  gjamPlot(out, plotPars = pl)

## ----many types, eval = FALSE--------------------------------------------
#  types <- c('OC','OC','OC','OC','CC','CC','CC','CC','CC','CA','CA','PA','PA')
#  f     <- gjamSimData(S = length(types), Q = 5, typeNames = types)
#  ml    <- list(ng = 2000, burnin = 500, typeNames = f$typeNames)
#  out   <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  tmp   <- data.frame(f$typeNames, out$inputs$classBySpec[,1:10])
#  print(tmp)

## ----mixed analysis, eval = FALSE----------------------------------------
#  pl  <- list(trueValues = f$trueValues, GRIDPLOTS = T)
#  gjamPlot(output = out, plotPars = pl)

## ----random group, eval = FALSE------------------------------------------
#  modelList$random <- 'columnNameInXdata'

## ----simulate missing data, eval = FALSE---------------------------------
#  f <- gjamSimData(typeNames = 'OC', nmiss = 20)
#  which(is.na(f$xdata), arr.ind = T)

## ----holdouts, eval = FALSE----------------------------------------------
#  f   <- gjamSimData(typeNames = 'CA', nmiss = 20)
#  ml  <- list(ng = 2000, burnin = 500, typeNames = f$typeNames, holdoutN = 50)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  
#  par(mfrow=c(1,3))
#  xMu  <- out$prediction$xpredMu        #inverse prediction of x
#  xSd  <- out$prediction$xpredSd
#  yMu  <- out$prediction$ypredMu        #predicted y
#  hold <- out$modelList$holdoutIndex    #holdout observations (rows)
#  
#  plot(out$inputs$x[hold,-1],xMu[hold,-1], cex=.2, xlab='True', ylab='Predictive mean')
#  title('holdouts in x'); abline(0,1)
#  plot(out$inputs$y[hold,], yMu[hold,], cex=.2, xlab='True', ylab='')
#  title('holdouts in y'); abline(0,1)
#  
#  xmiss <- out$missing$xmiss                              #locations of missing x
#  xmissMu   <- out$missing$xmissMu
#  xmissSe   <- out$missing$xmissSe
#  xmean <- apply(f$xdata,2,mean,na.rm=T)[xmiss[,2]] #column means for missing values
#  plot(xmean, xmissMu, xlab='Variable mean', ylab='Missing estimate') #posterior estimates
#  segments(xmean, xmissMu - 1.96*xmissSe, xmean, xmissMu + 1.96*xmissSe)          #approx 95% CI
#  title('missing x')

## ----effortPredict, eval = FALSE-----------------------------------------
#  sc   <- 3                               #no. CA responses
#  sd   <- 10                              #no. DA responses
#  tn   <- c( rep('CA',sc),rep('DA',sd) )  #combine CA and DA obs
#  S    <- length(tn)
#  n    <- 500
#  emat <- matrix( runif(n,.5,5), n, sd)              #simulated DA effort
#  eff  <- list(columns = c((sc+1):S), values = emat )
#  f    <- gjamSimData(n = n, typeNames = tn, effort = eff)
#  ml   <- list(ng = 2000, burnin = 500, typeNames = f$typeNames, effort = f$effort)
#  out  <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  
#  par(mfrow=c(1,2),bty='n')
#  gjamPredict(out, y2plot = colnames(f$ydata)[tn == 'DA']) #predict DA data

## ----effortPredictNew, eval = FALSE--------------------------------------
#  new <- list(xdata = f$xdata, effort=eff, nsim = 500 ) # effort unchanged
#  p1  <- gjamPredict(output = out, newdata = new)
#  
#  plot(f$y[,tn == 'DA'], p1$sdList$yMu[,tn == 'DA'],ylab = 'Predicted',cex=.1)
#  abline(0,1)
#  
#  new$effort$values <- eff$values*0 + 1       # predict for effort = 1
#  p2 <- gjamPredict(output = out, newdata = new)
#  
#  points(f$y[,tn == 'DA'], p2$sdList$yMu[,tn == 'DA'],col='orange',cex=.1)
#  abline(0,1)

## ----effortPredictCond, eval = FALSE-------------------------------------
#  new <- list(ydataCond = f$y[,1:2], nsim=200)   # cond on obs CA data
#  p1  <- gjamPredict(output = out, newdata = new)$sdList$yMu[,tn == 'DA']
#  
#  yc     <- f$y[,1:2]                                  # cond on new CA values
#  yc[,1] <- mean(yc[,1])
#  yc[,2] <- 0
#  new    <- list(ydataCond = yc, nsim=200)
#  p2     <- gjamPredict(output = out, newdata = new)$sdList$yMu[,tn == 'DA']
#  plot(f$y[,tn == 'DA'], p1, xlab='Obs', ylab = 'Pred', cex=.1,
#      ylim=range(c(p1,p2)))
#  points(f$y[,tn == 'DA'], p2,col='orange',cex=.1)
#  abline(0,1)

## ----input, eval = F-----------------------------------------------------
#  library(repmis)
#  d <- "https://github.com/jimclarkatduke/gjam/blob/master/forestTraits.RData?raw=True"
#  source_data(d)
#  
#  xdata <- forestTraits$xdata                          # n X Q
#  ydata  <- gjamReZero(forestTraits$treesDeZero)        # n X S
#  ydata <- ydata[,colnames(ydata) != 'other']
#  ydata <- gjamTrimY(ydata, 10, OTHER=F)$y

## ----gjamCA, eval=F------------------------------------------------------
#  rl      <- list(N = 15, r = 10)
#  ml      <- list(ng = 5000, burnin = 2000, typeNames = 'CA',
#                  reductList = rl, PREDICTX = F)
#  formula <- as.formula(~ temp + deficit*moisture)
#  out <- gjam(formula, xdata, ydata, modelList = ml)
#  
#  #prediction
#  newdata <- list(xdata = xdata, nsim=100)
#  tmp     <- gjamPredict(out, newdata=newdata)
#  full    <- tmp$sdList$yMu

## ----cond, eval=F--------------------------------------------------------
#  cnames <- sample(colnames(ydata),S/2)
#  wc     <- match(cnames, colnames(ydata))
#  
#  yc <- ydata[,cnames]
#  
#  newdata <- list(ydataCond = yc, nsim=200)
#  tmp     <- gjamPredict(out, newdata = newdata)
#  condy   <- tmp$sdList$yMu
#  
#  plot(ydata[,-wc], full[,-wc], ylim=c(range(ydata)), cex=.2)
#  abline(0,1)
#  points(ydata[,-wc],condy[,-wc],col=2, cex=.2)
#  rmspe <- c( mean((ydata[,-wc] - full[,-wc])^2),
#              mean((ydata[,-wc] - condy[,-wc])^2))
#  names(rmspe) <- c('unconditional','conditional')
#  rmspe

## ---- eval=FALSE---------------------------------------------------------
#  S   <- 200
#  f   <- gjamSimData(n = 100, S = S, typeNames='CA')
#  rl  <- list(r = 5, N = 20)
#  ml  <- list(ng = 2000, burnin = 500, typeNames = f$typeNames,
#              reductList = rl, PREDICTX = F)
#  out <- gjam(f$formula, f$xdata, f$ydata, modelList = ml)
#  pl  <- list(trueValues = f$trueValues, SMALLPLOTS = F)
#  gjamPlot(output = out, plotPars = pl)

## ----fungal data summary, bty='n', fig.width=6.5, eval=F-----------------
#  library(repmis)
#  d <- "https://github.com/jimclarkatduke/gjam/blob/master/fungEnd.RData?raw=True"
#  source_data(d)
#  
#  xdata  <- fungEnd$xdata
#  otu    <- gjamReZero(fungEnd$yDeZero)
#  status <- fungEnd$status
#  
#  par(mfrow=c(1,3), bty='n', mar=c(1,1,1,1), oma = c(0,0,0,0),
#      mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0), family='')
#  hist(status, main='Host condition (morbid = 0)', ylab = 'Host obs')
#  hist(otu, nclass=100, ylab = 'Reads', main='each observation')
#  nobs <- gjamTrimY(otu, minObs = 1, OTHER = F)$nobs
#  hist(nobs, nclass=100, ylab = 'Total reads per OTU', main='Full sample')

## ----get y, eval = F-----------------------------------------------------
#  tmp <- gjamTrimY(otu, minObs = 100)
#  y   <- tmp$y
#  dim(fungEnd$y)               # all OTUs
#  dim(y)                       # trimmed data
#  tail(colnames(y))            # 'other' class added

## ----trim y, eval=FALSE--------------------------------------------------
#  ydata <- cbind(status, y)     # host status is also a response
#  S     <- ncol(ydata)
#  typeNames    <- rep('CC',S)   # composition count data
#  typeNames[1] <- 'PA'          # binary host status

## ----factors, eval = F---------------------------------------------------
#  xdata$host <- relevel(xdata$host,'acerRubr')

## ----model fit, eval=F, eval=FALSE---------------------------------------
#  rl <- list(r = 5, N = 15)
#  ml <- list(ng = 2000, burnin = 500, typeNames = typeNames, reductList = rl)
#  output <- gjam(~ host*poly, xdata, ydata, modelList = ml)

## ----plots, eval=F-------------------------------------------------------
#  S <- ncol(ydata)
#  specColor     <- rep('black',S)
#  specColor[1]  <- 'red'                 # highlight host status
#  plotPars      <- list(specColor = specColor, GRIDPLOTS=T)
#  fit <- gjamPlot(output, plotPars)
#  fit$eComs[1:5,]

## ---- bstatus, eval=F----------------------------------------------------
#  beta <- fit$summaryCoeffs$betaCoeff
#  ws   <- grep('status_',rownames(beta))  # find coefficients for status
#  beta[ws,]

## ----bsig, eval=F--------------------------------------------------------
#  fit$summaryCoeffs$betaSig['status',]

## ----int, eval=F---------------------------------------------------------
#  x <- output$inputs$x
#  xvector <- x[1,]*0
#  names(xvector)  <- colnames(x)
#  
#  xvector['hostfraxAmer'] <- 1
#  xvector['polypoly'] <- 1
#  fit1 <- gjamIIE(output, xvector, omitY = 'other')
#  
#  par(mfrow=c(1,3), bty='n', mar=c(1,1,1,1), oma = c(0,0,0,0),
#      mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0))
#  gjamIIEplot(fit1, response = 'status', effectMu = 'direct',
#              effectSd = 'direct', legLoc = 'bottomright', ylim=c(-5,10))
#  title('Direct effect by host')
#  
#  gjamIIEplot(fit1, response = 'status', effectMu = 'int', effectSd = 'int',
#              legLoc = 'topright', ylim=c(-5,10))
#  title('Interactions with polyculture')
#  
#  gjamIIEplot(fit1, response = 'status', effectMu = 'ind', effectSd = 'ind',
#              legLoc = 'topright', ylim=c(-1,1))
#  title('Indirect effect of microbiome')

## ----predict, eval=F-----------------------------------------------------
#  y0 <- ydata[,1,drop=F]*0       #unhealthy host
#  
#  new    <- list(ydataCond = y0, nsim=50)
#  morbid <- gjamPredict(output, newdata = new )
#  
#  new     <- list(ydataCond = y0 + 1, nsim = 50 )
#  healthy <- gjamPredict(output, newdata = new )
#  
#  # compare predictions
#  y <- output$inputs$y
#  par(mfrow=c(1,2), bty='n')
#  plot(healthy$sdList$yMu[,-1],morbid$sdList$yMu[,-1], cex=.4,
#       xlab='healty',ylab='morbid')
#  abline(0, 1, lty=2,col='grey')
#  plot(y[,2:20],healthy$sdList$yMu[,2:20], cex=.4,col='orange',
#       xlab='Observed',ylab='Predicted', pch=16)
#  points(y[,2:20],morbid$sdList$yMu[,2:20], cex=.4,col='blue', pch=16)
#  abline(0, 1, lty=2,col='grey')

## ----traitBox1, fig.width = 7, fig.height = 3.5, echo = FALSE------------

.getBox <- function(x0,y0,tall,wide,col='white'){
  x1 <- x0 + wide
  y1 <- y0 + tall
  rect(x0, y0, x1, y1, col = col)
  mx <- mean(c(x0,x1))
  my <- mean(c(y0,y1))
  invisible(list( vec = c(x0,x1,y0,y1), mu = c(mx,my)) )
}

par(bty='n', mar=c(1,1,1,1), oma = c(0,0,0,0), 
    mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0), family='serif')

n <- 100
S <- 70
M <- 16
P <- 6
Q <- 14

xbox <- c(M,Q,M)
ybox <- c(n,n,Q)
xb <- c('M','Q','M')
yb <- c('n','n','Q')
xgap <- c(8,5,5)

ymax <- n + 6
xmax <- sum(xbox) + sum(xgap) + 5

plot(0,0,xlim=c(0,xmax),ylim=c(0,ymax),xaxt='n',yaxt='n',xlab='',ylab='',
     cex=.01)
xs <- 2

ti <- c('=','x','x')
ci <- c('U','X','beta')

for(j in 1:length(xbox)){
  
  ylo <- ymax - ybox[j]
  tmp <- .getBox(xs,ylo,ybox[j],xbox[j])
  xs  <- xgap[j] + tmp$vec[2]
  
  text(tmp$mu[1],ylo - 6,paste(yb[j],' x ',xb[j]))

  if(j < length(xbox))text(tmp$vec[2] + xgap[j]/2,ymax - ybox[j+1]/2, ti[j])
  if(j == 1)text(tmp$mu[1],tmp$mu[2],
                 expression(paste(italic(E),'[',bold(W),']')))
  if(j == 2)text(tmp$mu[1],tmp$mu[2],expression(bold(X)))
  if(j == 3)text(tmp$mu[1],tmp$mu[2],expression(hat(A)))
}

## ----input6, eval = F----------------------------------------------------
#  library(repmis)
#  d <- "https://github.com/jimclarkatduke/gjam/blob/master/forestTraits.RData?raw=True"
#  source_data(d)
#  
#  xdata <- forestTraits$xdata                          # n X Q
#  types <- forestTraits$traitTypes                     # 12 trait types
#  sbyt  <- forestTraits$specByTrait                    # S X 12
#  pbys  <- gjamReZero(forestTraits$treesDeZero)        # n X S
#  pbys  <- gjamTrimY(pbys,5)$y                         # at least 5 plots
#  sbyt  <- sbyt[match(colnames(pbys),rownames(sbyt)),] # trait matrix matches ydata
#  identical(rownames(sbyt),colnames(pbys))

## ----input7, eval = F----------------------------------------------------
#  table(sbyt$leaf)      # four levels
#  
#  table(sbyt$xylem)     # diffuse/tracheid vs ring-porous
#  
#  table(sbyt$repro)     # two levels

## ----input8, eval = F----------------------------------------------------
#  tmp         <- gjamSpec2Trait(pbys, sbyt, types)
#  tTypes      <- tmp$traitTypes                  # M = 15 values
#  u           <- tmp$plotByCWM                   # n X M
#  censor      <- tmp$censor                      # (0, 1) censoring, two-level CAT's
#  specByTrait <- tmp$specByTrait                 # S X M
#  M           <- ncol(u)
#  n           <- nrow(u)
#  types                                          # 12 individual trait types
#  cbind(colnames(u),tTypes)                      # M trait names and types

## ----setup2, eval = F----------------------------------------------------
#  censorList    <- gjamCensorY(values = c(0,1), intervals = cbind( c(-Inf,0),c(1,Inf) ),
#                               y = u, whichcol = c(13:14))$censor

## ----xdata, eval = F, echo = FALSE---------------------------------------
#  head(xdata)
#  table(xdata$soil)

## ----soil, eval = F------------------------------------------------------
#  xdata$soil <- relevel(xdata$soil,'reference')

## ----fit, eval = F-------------------------------------------------------
#  ml  <- list(ng = 3000, burnin = 500, typeNames = tTypes, holdoutN = 20,
#              censor=censor, notStandard = c('f1','f2','f3'))
#  out <- gjam(~ temp + stdage + moisture*deficit + deficit*soil,
#                   xdata = xdata, ydata = u, modelList = ml)
#  tnames <- colnames(u)
#  sc <- rep('black', M)                           # highlight types
#  wo <- which(tnames %in% c("leafN","leafP","SLA") )     # foliar traits
#  wf <- grep("leaf",tnames)                              # leaf habit
#  wc <- which(tnames %in% c("woodSG","diffuse","ring") ) # wood anatomy
#  
#  sc[wc] <- 'brown'
#  sc[wf] <- 'darkblue'
#  sc[wo] <- 'darkgreen'
#  
#  pl  <- list(GRIDPLOTS = TRUE, PLOTALLY = T, specColor = sc)
#  gjamPlot(output = out, plotPars = pl)
#  summary(out)

## ----fit pars, eval = F--------------------------------------------------
#  out$parameters$betaMu         # Q by M coefficient matrix alpha
#  out$parameters$betaStandXmu   # Q by M standardized for X
#  out$parameters$betaStandXWmu  # (Q-F) by M standardized for W/X, centered factors
#  
#  out$parameters$betaTable        # QM by stats posterior summary
#  out$parameters$betaStandXtable  # QM by stats posterior summary
#  out$parameters$betaStandXWtable # (Q-F)M by stats posterior summary
#  
#  out$parameters$sigMu         # M by M covariance matrix omega
#  out$parameters$sigSe         # M by M covariance std errors

## ----IIEx, eval = F------------------------------------------------------
#  xdrydry <- xwetdry  <- out$inputs$x[1,]
#  xdrydry['moisture'] <- xdrydry['deficit'] <- -1
#  xwetdry['moisture'] <- 1
#  xwetdry['deficit']  <- -1

## ----IIE1, eval = F------------------------------------------------------
#  par(mfrow=c(2,2), bty='n', mar=c(1,3,1,1), oma = c(0,0,0,0),
#      mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0), family='')
#  
#  fit1 <- gjamIIE(output = out, xvector = xdrydry)
#  fit2 <- gjamIIE(output = out, xvector = xwetdry)
#  
#  gjamIIEplot(fit1, response = 'leafbroaddeciduous',
#              effectMu = c('main','int'), effectSd = c('main','int'),
#              legLoc = 'bottomleft', ylim=c(-.31,.3))
#  title('deciduous')
#  gjamIIEplot(fit1, response = 'leafneedleevergreen',
#              effectMu = c('main','int'), effectSd = c('main','int'),
#              legLoc = 'bottomleft', ylim=c(-.3,.3))
#  title('evergreen')
#  
#  gjamIIEplot(fit2, response = 'leafbroaddeciduous',
#              effectMu = c('main','int'), effectSd = c('main','int'),
#              legLoc = 'bottomleft', ylim=c(-.3,.3))
#  gjamIIEplot(fit2, response = 'leafneedleevergreen',
#              effectMu = c('main','int'), effectSd = c('main','int'),
#              legLoc = 'bottomleft', ylim=c(-.3,.3))

## ----IIE4, eval = F------------------------------------------------------
#  xvector <- out$inputs$x[1,]
#  par(mfrow=c(2,1), bty='n', mar=c(1,1,1,1), oma = c(0,0,0,0),
#      mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0), family='')
#  
#  omitY <- colnames(u)[colnames(u) != 'leafbroaddeciduous'] # omit all but deciduous
#  
#  fit <- gjamIIE(out, xvector)
#  gjamIIEplot(fit, response = 'leafP', effectMu = c('main','ind'),
#              effectSd = c('main','ind'), legLoc = 'topright', ylim=c(-.6,.6))
#  title('foliar P')
#  gjamIIEplot(fit, response = 'leafN', effectMu = c('main','ind'),
#              effectSd = c('main','ind'), legLoc = 'bottomright', ylim=c(-.6,.6))
#  title('foliar N')

## ----traitBox2, fig.width = 6.7, fig.height = 4, echo = FALSE------------
par(bty='n', bty='n', mar=c(1,1,1,1), oma = c(0,0,0,0), 
    mar = c(3,2,2,1), tcl = -0.5, mgp = c(3,1,0), family='serif')

n <- 100
S <- 70
M <- 16
P <- 6
Q <- 14

xbox <- c(S,M,Q,S,M)
ybox <- c(n,S,n,Q,S)
xb   <- c('S','M','Q','S','M')
yb   <- c('n','S','n','Q','S')
xgap <- c(15,28,15,15,15,15)

ymax <- n + 5
xmax <- sum(xbox) + sum(xgap) + 5

plot(0,0,xlim=c(0,xmax),ylim=c(0,ymax),xaxt='n',yaxt='n',xlab='',ylab='',
     cex=.01)
xs <- xgap[1]

ti <- c('x','=','x','x')
ci <- c('W','T','X','beta','T')
col <- rep('white',length(xbox))
col[c(2,5)] <- 'wheat'

for(j in 1:length(xbox)){
  
  ylo <- ymax - ybox[j]
  tmp <- .getBox(xs,ylo,ybox[j],xbox[j], col[j])
  xs  <- xgap[j] + tmp$vec[2]
  
  text(tmp$mu[1], ylo - 6, paste(yb[j],' x ',xb[j]) )

  if(j < length(xbox))text(tmp$vec[2] + xgap[j]/2,ymax - ybox[j+1]/2, ti[j])
  if(j == 1)text(tmp$mu[1],tmp$mu[2],
                 expression(paste(italic(E),'[',bold(W),']')))
  if(j == 2)text(tmp$mu[1],tmp$mu[2],expression(bold(T)))
  if(j == 3)text(tmp$mu[1],tmp$mu[2],expression(bold(X)))
  if(j == 4)text(tmp$mu[1],tmp$mu[2],expression(hat(Beta)))
  if(j == 5)text(tmp$mu[1],tmp$mu[2],expression(bold(T)))
}

## ----PTM, eval = F-------------------------------------------------------
#  tl  <- list(plotByTrait = u, traitTypes = tTypes, specByTrait = specByTrait)
#  rl  <- list(r = 8, N = 25)
#  ml  <- list(ng = 2000, burnin = 500, typeNames = 'CC', holdoutN = 20,
#                    traitList = tl, reductList = rl)
#  out <- gjam(~ temp + stdage + deficit*soil, xdata = xdata,
#                       ydata = pbys, modelList = ml)
#  S  <- nrow(specByTrait)
#  sc <- rep('black',S)
#  
#  wr <- which(specByTrait[,'ring'] == 1)                  # ring porous
#  wb <- which(specByTrait[,'leafneedleevergreen'] == 1)   # evergreen
#  ws <- which(specByTrait[,'shade'] >= 4)                 # shade tolerant
#  sc[wr] <- 'brown'
#  sc[ws] <- 'black'
#  sc[wb] <- 'darkgreen'
#  
#  par(family = '')
#  pl  <- list(width=4, height=4, CORLINES=F, SMALLPLOTS=F,GRIDPLOTS=T,
#                    specColor = sc, ncluster = 5)
#  fit <- gjamPlot(output = out, pl)

## ----trait pars, eval = F------------------------------------------------
#  out$parameters$betaTraitXMu     # Q by M coefficient matrix alpha, standardized for X
#  out$parameters$betaTraitXWmu    # Q by M standardized for X/W
#  out$parameters$betaTraitXTable  # QM by stats posterior summary
#  out$parameters$betaTraitXWTable # QM by stats summary for X/W
#  out$parameters$varTraitMu       # M by M trait residual covariance, standardized for X
#  out$parameters$varTraitTable    # M^2 by stats summary, standardized for X/W

## ----trait pred, eval = F------------------------------------------------
#  out$prediction$tMu[1:5,]     # n by M predictive means
#  out$prediction$tSe[1:5,]     # n by M predictive std errors

## ----ecoms, eval = F-----------------------------------------------------
#  fit$eComs[,1:4]

## ----checkRank, eval=F---------------------------------------------------
#  x <- model.matrix(formula, xdata)
#  qr(x)$rank

## ----cont1, echo=F-------------------------------------------------------
D <- rbind( c(1, -1, -1), c(0,1,0), c(0, 0, 1))
colnames(D) <- c('intercept','b','c')
rownames(D) <- c('a','b','c')
C <- D
C[,1] <- 1
C

## ----cont2, echo=F-------------------------------------------------------
t(D)

