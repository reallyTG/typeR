library(DySeq)


### Name: MLAP_Trans
### Title: MLAP_Trans
### Aliases: MLAP_Trans

### ** Examples


# Example: Applying a APIM on the example data

# Transforms Sequences into Multi-Level data
ML_data<-ML_Trans(CouplesCope, 2:49, 50:97)

# Transforms transitions into lagged Actor and Partner effects
MLAP_data<-MLAP_Trans(ML_data)

# Data preparation

# In example data first seq referred to females
# and second to males

names(MLAP_data)[1]<-"sex"
MLAP_data$sex<-as.factor(MLAP_data$sex)
levels(MLAP_data$sex)<-c("female", "male")

# Effectcoding
MLAP_data$Partner[MLAP_data$Partner==0]<-(-1)
MLAP_data$Actor[MLAP_data$Actor==0]<-(-1)

# Fits a multi-level APIM using lme4
# Here a random intercept-only model
## Not run: 
##D ## make sure lme4 is installed!
##D ## and loaded!
##D #install.packages("lme4")
##D # library(lme4)
##D 
##D set.seed(1234)
##D glmer(DV~1+sex+Actor+Partner+Actor*Partner+
##D        sex*Actor+sex*Partner+sex*Actor*Partner+
##D        (1|ID),
##D      data=MLAP_data,
##D      family=binomial)
## End(Not run)





