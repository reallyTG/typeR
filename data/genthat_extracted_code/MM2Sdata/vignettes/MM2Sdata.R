## ----installAndLoadPackageFromCRAN,eval=FALSE----------------------------
#  install.packages("MM2Sdata")

## ----installAndLoadPackages,eval=TRUE------------------------------------
library(MM2Sdata)

## ----findMouseModelSubtypes----------------------------------------------
data(GSE36594Expr)
ExprMat<-exprs(GSE36594Expr)
GTML<-ExprMat[,grep("GTML_MB",(colnames(exprs(GSE36594Expr))))]

#Change mouse sample names for clarity
for(sample in 1:ncol(GTML))
{
  newnames<-strsplit(x=(colnames(GTML)[sample]),split="_")[[1]][1]
  colnames(GTML)[sample]<-newnames
}

# Determine Final Size of the Object
dim(GTML)

## ----findHumanModelSubtypes----------------------------------------------
data(GSE37418Expr)
head(pData(GSE37418Expr))
# Determine exact sample counts for each MB subtype across the 76 samples
table(pData(GSE37418Expr)$characteristics_ch1)

## ----InstallingFromGithubExample,echo=TRUE-------------------------------
# library(Biobase)
# library(devtools)
# install_github(repo="DGendoo/MM2S")
# install_github(repo="DGendoo/MM2Sdata")

## ----sessionInfo,echo=FALSE,results="tex"--------------------------------
toLatex(sessionInfo())

