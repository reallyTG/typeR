## ---- echo=FALSE, out.width="850px"--------------------------------------
knitr::include_graphics("./vignettefigures/vignettefigure.png")

## ---- echo=-2, fig.show='hold', fig.width=7, include=TRUE, warning=FALSE, message=FALSE----
library(featurefinder)
# mpg cars example
data(mpgdata)
data=mpgdata

# define some categorical factors here, for use in partition scanning. Define as many as desired.
data$transfactor=paste("trans",as.matrix(data$trans),sep="")
data$transfactor=as.factor(data$transfactor)

# define data dimensions
n=dim(data)[1] # total dimension
nn=floor(dim(data)[1]/2) # split point for training and test
data=as.data.frame(data)
nm=names(data)
nm[8]='y' ## select a column to be the target of the model
names(data)=nm

data0=data # retain full dataset
data=data[c("manufacturer","displ","year","transfactor","y") ] # select a subset for our first model

firstmodel=lm(formula=y ~ .,data=data)
expected=predict(firstmodel,data)
actual=data$y
residual=actual-expected
summary(firstmodel)

# drop terms that are not significant and refit model
data$manufacturerchevrolet=(data$manufacturer=='chevrolet')
data$manufacturerford=(data$manufacturer=='ford')
data$manufacturerhonda=(data$manufacturer=='honda')
data$manufacturernissan=(data$manufacturer=='nissan')
data$manufacturerpontiac=(data$manufacturer=='pontiac')
data$manufacturertoyota=(data$manufacturer=='toyota')
data$manufacturervolkswagen=(data$manufacturer=='volkswagen')
#data$displ
data$transfactortransautol4=(data$transfactor=='transauto(l4)')
data$transfactortransautol5=(data$transfactor=='transauto(l5)')
firstmodel=lm(formula=y ~ manufacturerchevrolet+
                manufacturerford+
                manufacturerhonda+
                manufacturernissan+
                manufacturerpontiac+
                manufacturertoyota+
                manufacturervolkswagen+
                displ+
                year
                #transfactortransautol4
                #transfactortransautol5
               , data=data)
expected=predict(firstmodel,data)
actual=data$y
residual=actual-expected
summary(firstmodel)

CSVPath=tempdir()
data1=cbind(data0,expected, actual, residual)
fcsv=paste(CSVPath,"/mpgdata.csv",sep="")
write.csv(data1[(nn+1):(length(data1$y)),],file=fcsv,row.names=FALSE)

exclusionVars="\"residual\",\"expected\", \"actual\",\"y\""
factorToNumericList=c()

# Now the dataset is prepared, try to find new features
tempDir=findFeatures(outputPath="NoPath", fcsv, exclusionVars,factorToNumericList,                     
         treeGenerationMinBucket=20,
         treeSummaryMinBucket=30,
         useSubDir=FALSE,
         tempDirFolderName="mpg")  

# potential terms identified in residual scan
# RESIDUAL: ALL,ALL,0.575,34.2,40,117,16,16.6,0.575,model< 16.5 and hwy< 28.5 and 
#                                                   manufacturer=jeep,lincoln,mercury,nissan,pontiac,subaru
# RESIDUAL: fl,r,1.11,38.4,33,86,20.1,21.2,1.11,hwy>=26.5
# RESIDUAL: class,compact,0.816,100,32,32,0,0,0,NA and root
# RESIDUAL: manufacturer,toyota,7.14e-13,100,34,34,0,0,0,NA and root
# RESIDUAL: trans,manual(m5),0.566,100,36,36,0,0,0,NA and root
# RESIDUAL: transfactor,transmanual(m5),0.566,100,36,36,0,0,0,NA and root

# add terms to dataset and refit
data$hwy=data0$hwy
data$fl=data0$fl
data$model=as.numeric(as.factor(data0$model))
data$model16hwy28manufacturer=(data$model< 16.5) & (data$hwy< 28.5)&(data$manufacturer=="jeep"|data$manufacturer=="lincoln"|data$manufacturer=="mercury"|data$manufacturer=="nissan"|data$manufacturer=="pontiac"|data$manufacturer=="subaru")
data$flr_hwy26=(data$fl=="r") & (data$hwy>=26.5)
data$transfactortransmanualm5=(data$transfactor=='transmanual(m5)')
data$manufacturertoyota=(data$manufacturer=='toyota')
data$classcompact=(data0$class=='compact')
data$flr=(data$fl=='r')
secondmodel=lm(formula=y ~ manufacturerchevrolet+
                            manufacturerford+
                            manufacturerhonda+
                            manufacturernissan+
                            manufacturerpontiac+
                            manufacturertoyota+
                            manufacturervolkswagen+
                            displ+
                            year+
                            # new terms
                            #model16hwy28manufacturer+
                            flr_hwy26+
                            transfactortransmanualm5+
                            manufacturertoyota
                            #classcompact+
                            #flr
               , data=data)
expected=predict(secondmodel,data)

summary(firstmodel)
summary(secondmodel)
# Append new features from the scan to a dataframe automatically
dataWithNewFeatures = addFeatures(df=data0, path=tempDir, prefix="auto_")
head(dataWithNewFeatures)

# https://vincentarelbundock.github.io/Rdatasets/datasets.html
# http://www.public.iastate.edu/~hofmann/data_in_r_sortable.html

## ---- echo=FALSE, fig.show='hold', fig.width=7, include=FALSE, message=FALSE, warning=FALSE----
# move example to a subfolder 
unlink("mpgexample", recursive=TRUE)
dir.create("mpgexample", showWarnings = FALSE)
file.copy(Sys.glob("./*.Rdata"), "./mpgexample/")
file.copy(Sys.glob("./*.png"), "./mpgexample/", recursive=TRUE)
file.copy(Sys.glob("./*.txt"), "./mpgexample/", recursive=TRUE)
unlink(Sys.glob("./*.Rdata"), recursive=FALSE)
unlink(Sys.glob("./*.png"), recursive=FALSE)
unlink(Sys.glob("./*.txt"), recursive=FALSE)

## ---- echo=-2, fig.show='hold', fig.width=7, include=TRUE, message=FALSE, warning=FALSE----
library(featurefinder)
data(futuresdata)
data=futuresdata
data$SMIfactor=paste("smi",as.matrix(data$SMIfactor),sep="")
n=length(data$DAX)
nn=floor(length(data$DAX)/2)

# Can we predict the relative movement of DAX and SMI?
data$y=data$DAX*0 # initialise the target to 0
data$y[1:(n-1)]=((data$DAX[2:n])-(data$DAX[1:(n-1)]))/
  (data$DAX[1:(n-1)])-(data$SMI[2:n]-(data$SMI[1:(n-1)]))/(data$SMI[1:(n-1)])

# Fit a simple model
firstmodel=lm(formula=y ~ DAX+SMI+
                            #CAC+
                            FTSE,
                            #SMIfactorsmi1
                            data=data)
expected=predict(firstmodel,data)
actual=data$y
residual=actual-expected
data0=data
data=cbind(data,expected, actual, residual)

CSVPath=tempdir()
fcsv=paste(CSVPath,"/futuresdata.csv",sep="")
write.csv(data[(nn+1):(length(data$y)),],file=fcsv,row.names=FALSE)

exclusionVars="\"residual\",\"expected\", \"actual\",\"y\""
factorToNumericList=c()

# Now the dataset is prepared, try to find new features
tempDir=findFeatures(outputPath="NoPath", fcsv, exclusionVars,factorToNumericList,                     
         treeGenerationMinBucket=30,
         treeSummaryMinBucket=50,
         useSubDir=FALSE,
         tempDirFolderName="futures")  

newfeat1=((data$SMIfactor=="smi0") & (data$CAC < 2253) & (data$CAC< 1998) & (data$CAC>=1882)) * 1.0
newfeat2=((data$SMIfactor=="smi1") & (data$SMI < 7837) & (data$SMI >= 7499)) * 1.0
newfeatures=cbind(newfeat1, newfeat2) # create columns for the newly found features
datanew=cbind(data0,newfeatures)

secondmodel=lm(formula=y ~ DAX+SMI+
                           #CAC+
                           FTSE+
                           #SMIfactorsmi1+
                           newfeat1+newfeat2,
                data=datanew[,])
expectednew=predict(secondmodel,datanew)

require(Metrics)
OriginalRMSE = rmse(data$y,expected)
NewRMSE = rmse(data$y,expectednew)

print(paste("OriginalRMSE = ",OriginalRMSE))
print(paste("NewRMSE = ",NewRMSE))


summary(firstmodel)
summary(secondmodel)

# Append new features from the scan to a dataframe automatically
dataWithNewFeatures = addFeatures(df=data0, path=tempDir, prefix="auto_")
head(dataWithNewFeatures)


## ---- echo=FALSE, fig.show='hold', fig.width=7, include=FALSE, message=FALSE, warning=FALSE----
# move example to a subfolder 
unlink("daxexample", recursive=TRUE)
dir.create("daxexample", showWarnings = FALSE)
file.copy(Sys.glob("./*.Rdata"), "./daxexample/")
file.copy(Sys.glob("./*.png"), "./daxexample/", recursive=TRUE)
file.copy(Sys.glob("./*.txt"), "./daxexample/", recursive=TRUE)
unlink(Sys.glob("./*.Rdata"), recursive=FALSE)
unlink(Sys.glob("./*.png"), recursive=FALSE)
unlink(Sys.glob("./*.txt"), recursive=FALSE)

