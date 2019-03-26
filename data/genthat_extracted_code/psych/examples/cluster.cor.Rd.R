library(psych)


### Name: scoreOverlap
### Title: Find correlations of composite variables (corrected for overlap)
###   from a larger matrix.
### Aliases: cluster.cor scoreOverlap
### Keywords: multivariate models

### ** Examples

#use the msq data set that shows the structure of energetic and tense arousal
small.msq <- msq[ c("active", "energetic", "vigorous", "wakeful", "wide.awake", 
"full.of.pep", "lively", "sleepy", "tired", "drowsy","intense", "jittery", "fearful",
 "tense", "clutched.up", "quiet", "still",    "placid", "calm", "at.rest") ]
small.R <- cor(small.msq,use="pairwise")
keys.list <- list(
EA = c("active", "energetic", "vigorous", "wakeful", "wide.awake", "full.of.pep",
       "lively", "-sleepy", "-tired", "-drowsy"),
TA =c("intense", "jittery", "fearful", "tense", "clutched.up", "-quiet", "-still", 
       "-placid", "-calm", "-at.rest") ,

high.EA = c("active", "energetic", "vigorous", "wakeful", "wide.awake", "full.of.pep",
       "lively"),
low.EA =c("sleepy", "tired", "drowsy"),
lowTA= c("quiet", "still", "placid", "calm", "at.rest"),
highTA = c("intense", "jittery", "fearful", "tense", "clutched.up")
   ) 
   
keys <- make.keys(small.R,keys.list)
      
adjusted.scales <- scoreOverlap(keys.list,small.R)
#compare with unadjusted
confounded.scales <- cluster.cor(keys,small.R)
summary(adjusted.scales)
#note that the EA and high and low EA and TA and high and low TA 
# scale correlations are confounded
summary(confounded.scales) 



