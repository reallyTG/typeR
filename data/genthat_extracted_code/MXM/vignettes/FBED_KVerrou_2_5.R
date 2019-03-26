## ---- warning =  FALSE, message = FALSE----------------------------------

### ~ ~ ~ Load Packages ~ ~ ~ ###
library(MXM) 
library(dplyr)


## ------------------------------------------------------------------------

### ~ ~ ~ Load The Dataset ~ ~ ~ ###
wine.url <- "ftp://ftp.ics.uci.edu/pub/machine-learning-databases/wine/wine.data"
wine <- read.csv(wine.url,
                 check.names = FALSE,
                 header = FALSE) 
head(wine)
str(wine)
colnames(wine) <- c('Type', 'Alcohol', 'Malic', 'Ash', 
                    'Alcalinity', 'Magnesium', 'Phenols', 
                    'Flavanoids', 'Nonflavanoids',
                    'Proanthocyanins', 'Color', 'Hue', 
                    'Dilution', 'Proline')

## ------------------------------------------------------------------------
### ~ ~ ~ Removing The Categorical ('Type') and The Target ('Nonflavanoids') Variables ~ ~ ~ ###

wine_dataset <- dplyr::select(wine,
                              -contains("Type"),
                              -contains("Nonflavanoids")) 
head(wine_dataset)

## ------------------------------------------------------------------------
wine_target <- wine$Nonflavanoids
head(wine_target)

## ------------------------------------------------------------------------
### ~ ~ ~ Running FBED with eBIC ~ ~ ~ ###
fbed_cont_eBIC <- MXM::fbed.reg(target     = wine_target,
                                 dataset   = wine_dataset, 
                                 test      = "testIndFisher", 
                                 threshold = 0.05,
                                 wei       = NULL,
                                 K         = 10,
                                 method    = "eBIC",
                                 gam       = NULL,
                                 backward  = TRUE)

## ------------------------------------------------------------------------
### ~ ~ ~ Running FBED with LR ~ ~ ~ ###
fbed_cont_LR <- MXM::fbed.reg(target       = wine_target,
                                 datase    = wine_dataset, 
                                 test      = "testIndFisher", 
                                 threshold = 0.05,
                                 wei       = NULL,
                                 K         = 10,
                                 method    = "LR",
                                 gam       = NULL,
                                 backward  = TRUE)

## ------------------------------------------------------------------------
### ~ ~ ~ eBIC results ~ ~ ~ ###
fbed_cont_eBIC$res
SelectedVars_names<-colnames(wine_dataset[fbed_cont_eBIC$res[,1]])
SelectedVars_names

## ------------------------------------------------------------------------
### ~ ~ ~ LR results ~ ~ ~ ###
fbed_cont_LR$res
SelectedVars_names<-colnames(wine_dataset[fbed_cont_LR$res[,1]])
SelectedVars_names

## ------------------------------------------------------------------------
fbed_cont_eBIC$res[,2]
fbed_cont_LR$res[,2]

## ------------------------------------------------------------------------
fbed_cont_eBIC$info

## ------------------------------------------------------------------------
fbed_cont_LR$info

## ------------------------------------------------------------------------
fbed_cont_eBIC$back.rem 
fbed_cont_LR$back.rem 

## ------------------------------------------------------------------------
fbed_cont_eBIC$back.n.tests 

## ------------------------------------------------------------------------
fbed_cont_LR$back.n.tests 

## ------------------------------------------------------------------------
fbed_cont_eBIC$runtime 

## ------------------------------------------------------------------------
fbed_cont_LR$runtime 

## ------------------------------------------------------------------------
### ~ ~ ~ Taking The Whole Dataset ~ ~ ~ ###
wine_dataset <- dplyr::select(wine,
                              -contains("Type")) 
head(wine_dataset)

wine_target <- as.factor(wine$Type)
head(wine_target)

## ---- message=FALSE------------------------------------------------------
### ~ ~ ~ Running FBED For Categorical Variable with eBIC~ ~ ~ ###
fbed_categorical_eBIC <- MXM::fbed.reg(target = wine_target,
                                 dataset      = wine_dataset, 
                                 test         = "testIndMultinom",
                                 threshold    = 0.05,
                                 wei          = NULL,
                                 K            = 10,
                                 method       = "eBIC",
                                 gam          = NULL,
                                 backward     = TRUE) 


## ---- message=FALSE, warning=FALSE---------------------------------------
### ~ ~ ~ Running FBED For Categorical Variable with LR~ ~ ~ ###
fbed_categorical_LR <- MXM::fbed.reg(target = wine_target,
                                 dataset    = wine_dataset, 
                                 test       = "testIndMultinom",
                                 threshold  = 0.05,
                                 wei        = NULL,
                                 K          = 10,
                                 method     = "LR",
                                 gam        = NULL,
                                 backward   = TRUE) 


## ------------------------------------------------------------------------
### ~ ~ ~ eBIC results ~ ~ ~ ###
fbed_categorical_eBIC$res
SelectedVars_names<-colnames(wine_dataset[fbed_categorical_eBIC$res[,1]])
SelectedVars_names

## ------------------------------------------------------------------------
### ~ ~ ~ LR results ~ ~ ~ ###
fbed_categorical_LR$res
SelectedVars_names<-colnames(wine_dataset[fbed_categorical_LR$res[,1]])
SelectedVars_names

## ------------------------------------------------------------------------
fbed_categorical_eBIC$info
fbed_categorical_LR$info

## ------------------------------------------------------------------------
fbed_categorical_eBIC$back.rem 
fbed_categorical_LR$back.rem 

## ------------------------------------------------------------------------
fbed_categorical_eBIC$back.n.tests 
fbed_categorical_LR$back.n.tests 


## ------------------------------------------------------------------------
fbed_categorical_eBIC$runtime 
fbed_categorical_LR$runtime 


## ------------------------------------------------------------------------
### ~ ~ ~ Running FBED For Many K ~ ~ ~ ###
wine_dataset <- dplyr::select(wine,
                              -contains("Type"),
                              -contains("Nonflavanoids")) 
wine_target <- wine$Nonflavanoids
fbed_cont_eBIC_manyK <- MXM::fbed.reg(target = wine_target,
                                 datase    = wine_dataset, 
                                 test      = "testIndFisher", 
                                 threshold = 0.05,
                                 wei       = NULL,
                                 K         = 0:5,
                                 method    = "LR",
                                 gam       = NULL,
                                 backward  = TRUE)


## ------------------------------------------------------------------------
### ~ ~ ~ statistics about K=1 ~ ~ ~ ###
fbed_cont_eBIC_manyK$mod$`K=1`

## ------------------------------------------------------------------------
sessionInfo()

