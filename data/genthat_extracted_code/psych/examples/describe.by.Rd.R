library(psych)


### Name: describeBy
### Title: Basic summary statistics by group
### Aliases: describeBy describe.by
### Keywords: models univar

### ** Examples


data(sat.act)
describeBy(sat.act,sat.act$gender) #just one grouping variable	
#describeBy(sat.act,list(sat.act$gender,sat.act$education))  #two grouping variables
des.mat <- describeBy(sat.act$age,sat.act$education,mat=TRUE) #matrix (data.frame) output 
des.mat <- describeBy(sat.act$age,list(sat.act$education,sat.act$gender),
             mat=TRUE,digits=2)  #matrix output





