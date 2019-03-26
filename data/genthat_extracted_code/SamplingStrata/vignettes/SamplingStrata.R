## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=TRUE, echo=FALSE, include=FALSE-------------------------------
load("vignette.RData")

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
library(SamplingStrata)
data(swissmunicipalities)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
swissmunicipalities$id <- c(1:nrow(swissmunicipalities))
swissframe <- buildFrameDF(df = swissmunicipalities,
                           id = "id",
                           X = c("POPTOT",
                                 "Surfacesbois",
                                 "Surfacescult",
                                 "Alp",
                                 "Airbat",
                                 "Airind"),
                           Y = c("Pop020",
                                 "Pop2040",
                                 "Pop4065",
                                 "Pop65P"),
                           domainvalue = "REG")
str(swissframe)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
library(SamplingStrata)
swissframe$X1 <- var.bin(swissmunicipalities$POPTOT, bins=18)
swissframe$X2 <- var.bin(swissmunicipalities$Surfacesbois, bins=3)
swissframe$X3 <- var.bin(swissmunicipalities$Surfacescult, bins=3)
swissframe$X4 <- var.bin(swissmunicipalities$Alp, bins=3)
swissframe$X5 <- var.bin(swissmunicipalities$Airbat, bins=3)
swissframe$X6 <- var.bin(swissmunicipalities$Airind, bins=3)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
library(SamplingStrata)
data(swissframe)
head(swissframe)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
swissmunicipalities$id <- c(1:nrow(swissframe))
newframe <- buildFrameDF(df = swissmunicipalities,
                         id = "id",
                         X = "id",
                         Y = c("Pop020",
                               "Pop2040",
                               "Pop4065",
                               "Pop65P"),
                         domainvalue = "REG")
str(newframe)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
data(strata)
head(strata)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
  swissstrata <- buildStrataDF(swissframe, progress = FALSE)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
head(swissstrata)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
data(swissstrata)

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  samp <- read.delim("samplePrev.txt")

## ---- eval=FALSE, echo=TRUE----------------------------------------------
#  strata <- buildStrataDF(samp)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
data(swisserrors)
swisserrors

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
checkInput(errors = checkInput(errors = swisserrors, 
                               strata = swissstrata, 
                               sampframe = swissframe))

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
cv <- swisserrors[1,]
cv

## ---- eval=TRUE,echo=TRUE------------------------------------------------
allocation <- bethel(swissstrata,cv)
sum(allocation)

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  solution1 <- optimizeStrata(
#  	errors = swisserrors,
#  	strata = swissstrata,
#  	parallel = TRUE,
#  	writeFiles = FALSE,
#  	showPlot = FALSE)

## ---- out.width = "600px", echo = FALSE----------------------------------
knitr::include_graphics("output/plotdom3.png")

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
expected_CV(solution1$aggr_strata)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
swisserrors

## ---- eval=TRUE, echo=TRUE, warning=FALSE--------------------------------
solutionKmeans1 <- KmeansSolution(swissstrata,
                                   swisserrors,
                                   nstrata=NA,
                                   minnumstrat=2,
                                   maxclusters=NA,
                                   showPlot=FALSE)
head(solutionKmeans1)

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  solution_with_kmeans <- optimizeStrata(
#  	errors = swisserrors,
#  	strata = swissstrata,
#  	suggestions = solutionKmeans1,
#  	parallel = TRUE,
#  	writeFiles = TRUE,
#  	showPlot = FALSE)

## ---- eval=TRUE, echo=TRUE, warning=FALSE--------------------------------
sum(ceiling(solution_with_kmeans$aggr_strata$SOLUZ))

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
adjustedStrata <- adjustSize(size=150,strata=solution1$aggr_strata,cens=NULL)
sum(adjustedStrata$SOLUZ)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
adjustedStrata <- adjustSize(size=250,strata=solution1$aggr_strata,cens=NULL)
sum(adjustedStrata$SOLUZ)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
newstrata <- updateStrata(swissstrata, 
                          solution1, 
                          writeFiles = TRUE)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
strata_aggregation <- read.delim("strata_aggregation.txt")
head(strata_aggregation)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
framenew <- updateFrame(swissframe, newstrata, writeFiles=FALSE)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
sample <- selectSample(framenew, solution1$aggr_strata, writeFiles=FALSE)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
# adding POPTOT to framenew
data("swissmunicipalities")
framenew <- merge(framenew,swissmunicipalities[,c("REG","Nom","POPTOT")],
                  by.x=c("REG","ID"),by.y=c("REG","Nom"))
# selection of sample with systematic method
sample <- selectSampleSystematic(frame=framenew,
                                 outstrata=solution1$aggr_strata,
                                 sortvariable = c("POPTOT"))
head(sample,3)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
eval <- evalSolution(framenew, 
                     solution1$aggr_strata, 
                     nsampl=100, 
                     writeFiles=FALSE,
                     progress=FALSE) 

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
eval$coeff_var
swisserrors

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
eval$rel_bias

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
dom = 1
hist(eval$est$Y1[eval$est$dom == dom], col = "grey", border = "white",
     xlab = expression(hat(Y)[1]),
     freq = FALSE,
     main = paste("Variable Y1 Domain ",dom,sep=""))
abline(v = mean(eval$est$Y1[eval$est$dom == dom]), col = "blue", lwd = 2)
abline(v = mean(swissframe$Y1[swissframe$domainvalue==dom]), col = "red")
legend("topright", c("distribution mean", "true value"),
       lty = 1, col = c("blue", "red"), box.col = NA, cex = 0.8)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
data(swisserrors)
data(swissstrata)
data(swissframe)
#----Selection of units to be censused from the frame
ind_framecens <- which(swissframe$X1 > 12 |
                       swissframe$X2 > 2 | 
                       swissframe$X3 > 2 |
                       swissframe$X4 > 2 |
                       swissframe$X5 > 2 | 
                       swissframe$X6 > 2 )
framecens <- swissframe[ind_framecens,]
nrow(framecens)
#----Selection of units to be sampled from the frame
# (complement to the previous)
framesamp <- swissframe[-ind_framecens,]
nrow(framesamp)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
# Build strata to be censused and sampled
cens <- buildStrataDF(framecens,progress = FALSE)
sum(cens$N)
strata <- buildStrataDF(framesamp,progress = FALSE)
sum(strata$N)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
sum(cens$N)
sum(strata$N)

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  solution2 <- optimizeStrata(
#  	errors = swisserrors,
#  	strata = strata,
#  	cens = cens,
#  	strcens = TRUE,
#  	parallel = TRUE,
#  	writeFiles = TRUE,
#  	showPlot = FALSE
#  )

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
newstrata <- updateStrata(strata, solution2)
# updating sampling frame with new strata labels
framenew <- updateFrame(frame=framesamp,newstrata=newstrata)
# selection of sample from sampling strata
sample <- selectSample(frame=framenew,outstrata=solution2$aggr_strata)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
# addition of necessary variables to 
colnames(framesamp) <- toupper(colnames(framesamp))
colnames(framecens) <- toupper(colnames(framecens))
framecens$WEIGHTS <- rep(1,nrow(framecens))
framecens$FPC <- rep(1,nrow(framecens))
framecens$LABEL <- rep("999999",nrow(framecens))
framecens$STRATUM <- rep("999999",nrow(framecens))
framecens$STRATO <- rep("999999",nrow(framecens))

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
survey <- rbind(sample,framecens)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
survey$cens <- ifelse(survey$LABEL == "999999",1,0)
table(survey$cens)

## ---- eval=TRUE, echo=TRUE-----------------------------------------------
cens2 <- cens[,-c(14:19)]
cens2$SOLUZ <- cens2$N
stratatot <- rbind(solution2$aggr_strata,cens2)
expected_CV(stratatot)

## ---- eval = T-----------------------------------------------------------
data(nations)
head(nations)

## ---- eval = T-----------------------------------------------------------
set.seed(1234)
nations_sample <- nations[sample(c(1:207),70),]

## ---- eval = T-----------------------------------------------------------
mod_logGDP_INFMORT <- lm(log(nations_sample$infant.mortality) ~ log(nations_sample$GDP))
summary(mod_logGDP_INFMORT)

## ---- eval = T-----------------------------------------------------------
mod_logGDP_CONTRA <- lm(log(nations_sample$contraception) ~ log(nations_sample$GDP))
summary(mod_logGDP_CONTRA)

## ---- eval = T-----------------------------------------------------------
nations$progr <- c(1:nrow(nations))
nations$dom <- 1
frame <- buildFrameDF(nations,
                      id="Country",
                      X="progr",
                      Y=c("GDP","GDP"),
                      domainvalue = "dom")

## ---- eval = T-----------------------------------------------------------
cv <- as.data.frame(list(DOM=rep("DOM1",1),
                         CV1=rep(0.10,1),
                         CV2=rep(0.05,1),
                         domainvalue=c(1:1)
                    ))
cv

## ---- eval = T-----------------------------------------------------------
strata1 <- buildStrataDF(frame, progress = FALSE)
solution3 <- optimizeStrata(cv,
                           strata1,
                           iter = 50,
                           pops = 20,
                           parallel = FALSE,
                           suggestions = KmeansSolution(strata1,cv),
                           writeFiles = FALSE,
                           showPlot = FALSE)
sum(solution3$aggr_strata$SOLUZ)

## ---- eval = T-----------------------------------------------------------
newstrata <- updateStrata(strata1,solution3)
framenew1 <- updateFrame(frame,newstrata)
framenew1 <- framenew1[order(framenew1$ID),]
framenew1$Y2 <- nations$infant.mortality
framenew1$Y3 <- nations$contraception
results1 <- evalSolution(framenew1, solution3$aggr_strata, 50, progress = FALSE)
results1$coeff_var

## ---- eval = T-----------------------------------------------------------
model <- NULL
model$beta[1] <- mod_logGDP_INFMORT$coefficients[2]
model$sig2[1] <- summary(mod_logGDP_INFMORT)$sigma
model$type[1] <- "loglinear"
model$gamma[1] <- 0
model$beta[2] <- mod_logGDP_CONTRA$coefficients[2]
model$sig2[2] <- summary(mod_logGDP_CONTRA)$sigma
model$type[2] <- "loglinear"
model$gamma[2] <- 0
model <- as.data.frame(model)
model

## ---- eval = T-----------------------------------------------------------
strata2 <- buildStrataDF(frame, model = model, progress = FALSE)
head(strata2)

## ---- eval = T-----------------------------------------------------------
strata2 <- buildStrataDF(frame, model = model, progress = FALSE)
solution4 <-
  optimizeStrata(
    errors = cv , 
    strata = strata2, 
    iter = 50, 
    pops = 20, 
    parallel = FALSE,
    suggestions = KmeansSolution(strata2,cv),
    showPlot = FALSE,
    writeFiles = FALSE)

## ---- eval = T-----------------------------------------------------------
newstrata <- updateStrata(strata2,solution4)
framenew2 <- updateFrame(frame,newstrata)
framenew2 <- framenew2[order(framenew2$ID),]
framenew2$Y2 <- nations$infant.mortality
framenew2$Y3 <- nations$contraception
results2 <- evalSolution(framenew2, solution4$aggr_strata, 50, progress = FALSE)
results2$coeff_var

## ---- eval = T-----------------------------------------------------------
data("swissmunicipalities")
swissmunicipalities$id <- c(1:nrow(swissmunicipalities))
swissmunicipalities$dom <- 1
frame <- buildFrameDF(swissmunicipalities,
                      id = "id",
                      domainvalue = "REG",
                      X = c("Surfacesbois","Surfacescult"),
                      Y = c("Pop020", "Pop2040")
)
# choice of units to be selected in any case (census units)
framecens <- frame[frame$X1 > 2500 
                   | frame$X2 > 1200,]
# remaining units 
framesamp <- frame[!(frame$id %in% framecens$id),]
# precision constraints
errors <- NULL
errors$DOM <- "DOM1"
errors$CV1 <- 0.1
errors$CV2 <- 0.1
errors <- as.data.frame(errors)
errors <- errors[rep(row.names(errors),7),]
errors$domainvalue <- c(1:7)
errors

## ---- eval = FALSE-------------------------------------------------------
#  solution5 <- optimizeStrata2 (
#    errors,
#    framesamp = framesamp,
#    framecens = framecens,
#    strcens = TRUE,
#    alldomains = FALSE,
#    dom = 4,
#    iter = 50,
#    pops = 20,
#    nStrata = 5,
#    writeFiles = FALSE,
#    showPlot = FALSE,
#    parallel = FALSE
#  )

## ---- eval = T, echo=TRUE------------------------------------------------
sum(round(solution5$aggr_strata$SOLUZ))
expected_CV(solution5$aggr_strata)

## ---- include=TRUE-------------------------------------------------------
framenew <- solution5$framenew
table(framenew$LABEL)

## ---- eval = T,echo=TRUE-------------------------------------------------
outstrata <- plotStrata2d(
                  solution5$framenew, 
                  solution5$aggr_strata,
                  domain = 4, 
                  vars = c("X1","X2"),
                  labels =     c("Surfacesbois","Surfacescult")
                  )

## ---- eval = T,echo=TRUE-------------------------------------------------
outstrata

## ---- eval = T,echo=TRUE-------------------------------------------------
samp <- selectSample(solution5$framenew,solution$aggr_strata)

