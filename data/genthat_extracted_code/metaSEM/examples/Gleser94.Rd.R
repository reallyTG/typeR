library(metaSEM)


### Name: Gleser94
### Title: Two Datasets from Gleser and Olkin (1994)
### Aliases: Gleser94
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Gleser94)
##D 
##D ## Multiple-treatment studies
##D Gleser94$MTS
##D 
##D ## Assuming homogeneity of variances
##D t(apply(Gleser94$MTS, MARGIN=1,
##D         function(x)
##D             smdMTS(m=x[c("Mean.C", "Mean.E1", "Mean.E2", "Mean.E3", "Mean.E4", "Mean.E5")],
##D                    v=x[c("SD.C", "SD.E1", "SD.E2", "SD.E3", "SD.E4", "SD.E5")]^2,
##D                    n=x[c("N.C", "N.E1", "N.E2", "N.E3", "N.E4", "N.E5")],
##D                    homogeneity="variance", list.output=FALSE)))
##D                           
##D ## Multiple-endpoint studies
##D Gleser94$MES
##D 
##D ## Calculate the sampling variances and covariance and amend into the data set
##D Gleser94$MES$Uncoached.V11 <- with(Gleser94$MES, SD.Uncoached.Math^2)
##D Gleser94$MES$Uncoached.V21 <- with(Gleser94$MES,
##D                                    SD.Uncoached.Math*Cor.Math.Verbal*SD.Uncoached.Verbal)
##D Gleser94$MES$Uncoached.V22 <- with(Gleser94$MES, SD.Uncoached.Verbal^2)
##D 
##D Gleser94$MES$Coached.V11 <- with(Gleser94$MES, SD.Coached.Math^2)
##D Gleser94$MES$Coached.V21 <- with(Gleser94$MES,
##D                                  SD.Coached.Math*Cor.Math.Verbal*SD.Coached.Verbal)
##D Gleser94$MES$Coached.V22 <- with(Gleser94$MES, SD.Coached.Verbal^2)
##D 
##D ## Assuming homogeneity of covariance matrices
##D t(apply(Gleser94$MES, MARGIN=1,
##D         function(x)
##D             smdMES(m1=x[c("Mean.Uncoached.Math", "Mean.Uncoached.Verbal")],
##D                    m2=x[c("Mean.Coached.Math", "Mean.Coached.Verbal")],
##D                    V1=vec2symMat(x[c("Uncoached.V11", "Uncoached.V21", "Uncoached.V22")]),
##D                    V2=vec2symMat(x[c("Coached.V11", "Coached.V21", "Coached.V22")]),
##D                    n1=x["N.Uncoached"],
##D                    n2=x["N.Coached"],
##D                    homogeneity="covariance", list.output=FALSE)))
## End(Not run)



