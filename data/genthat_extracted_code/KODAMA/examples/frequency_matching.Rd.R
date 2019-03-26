library(KODAMA)


### Name: frequency_matching
### Title: Frequency Matching
### Aliases: frequency_matching

### ** Examples

data(clinical)

A=categorical_table("Gender",clinical[,"Gender"],clinical[,"Hospital"])
B=categorical_table("Gleason score",clinical[,"Gleason score"],clinical[,"Hospital"])
C=categorical_table("Ethnicity",clinical[,"Ethnicity"],clinical[,"Hospital"])

D=continuous_table("BMI",clinical[,"BMI"],clinical[,"Hospital"],digits=2)
E=continuous_table("Age",clinical[,"Age"],clinical[,"Hospital"],digits=1)

# Analysis without matching
rbind(A,B,C,D,E)



# The order is important. Right is more important than left in the vector
# So, Ethnicity will be more important than Age
var=c("Age","BMI","Gleason score" ,"Ethnicity")
t=frequency_matching(clinical[,var],clinical[,"Hospital"],times=1)

newdata=clinical[t$selection,]

A=categorical_table("Gender",newdata[,"Gender"],newdata[,"Hospital"])
B=categorical_table("Gleason score",newdata[,"Gleason score"],newdata[,"Hospital"])
C=categorical_table("Ethnicity",newdata[,"Ethnicity"],newdata[,"Hospital"])

D=continuous_table("BMI",newdata[,"BMI"],newdata[,"Hospital"],digits=2)
E=continuous_table("Age",newdata[,"Age"],newdata[,"Hospital"],digits=1)

# Analysis with matching
rbind(A,B,C,D,E)




