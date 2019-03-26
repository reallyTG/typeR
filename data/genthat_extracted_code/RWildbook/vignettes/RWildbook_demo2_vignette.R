## ------------------------------------------------------------------------
## Load other packages
library(RWildbook)
library(marked)

## ----eval=FALSE----------------------------------------------------------
#  ## Extract data for individual A-001 through A-099
#  vignette_2_data <- searchWB(username="username",
#                              password="password",
#                              baseURL ="whaleshark.org",
#                              object="Encounter",
#                              individualID=paste0("A-0",rep(0:9,rep(10,10)),rep(0:9,10))[-1])

## ------------------------------------------------------------------------
data("vignette_2_data",package="RWildbook")
head(vignette_2_data)[,c("individualID","location","year","month","day")]

## ------------------------------------------------------------------------
 ## Define start and end dates of capture occasions
 start.dates1 <- paste0(1998:2016,"-01-01") #Define the start.date value
 end.dates1 <- paste0(1998:2016,"-04-01") #Define the end.date value

 ## Format data for use in marked
 markedData1 <- markedData(data = vignette_2_data,
                              varname_of_capturetime = "dateInMilliseconds",
                              varlist = c("individualID"),
                              start.dates = start.dates1,
                              end.dates = NULL,
                              date_format = "%Y-%m-%d",
                              origin = "1970-01-01")

## ------------------------------------------------------------------------
 ## Fit simple CJS model in marked
 markedData1.proc=process.data(markedData1,model="cjs",begin.time=1)
 markedData1.ddl=make.design.data(markedData1.proc)
 markedData1.cjs=crm(markedData1.proc,markedData1.ddl,model.parameters=list(Phi=list(formula=~time),p=list(formula=~time)))

## ----fig.width=6,fig.height=4--------------------------------------------
## Plot parameter estimates
plot(1998:2015,markedData1.cjs$results$reals$Phi$estimate,
        pch=16,col="green",
        main="Estimated Capture and Survival Probabilities",
        xlab="Occasion",ylab="Estimate",ylim=c(0,1))
points(1999:2016,markedData1.cjs$results$reals$p$estimate,pch=16,col="blue")
legend("bottomright",pch=16,col=c("green","blue"),legend=c("Survival","Capture"))

