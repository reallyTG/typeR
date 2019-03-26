library(multicon)


### Name: plotProfile
### Title: Visualizing Profiles of Scores
### Aliases: plotProfile
### Keywords: item scoring composite

### ** Examples


data(bfi)
keys.list <- list("agree"=c(-1,2,3,4,5),
  "conscientious"=c(6,7,8,-9,-10),"extraversion"=c(-11,-12,13,14,15),
  "neuroticism"=c(16,17,18,19,20),"openness"=c(21,-22,23,24,-25))
out <- scoreTest(bfi, keys.list, nomiss=0, maxScore=6, minScore=1)
plotProfile(out, rows=1:3, xlab="", ylab="Score", col=c("red", "blue", "green"),
         main="Big 5 Profiles for Three Subjects", ylim=c(1,6), item.names=names(out))
legend("bottomleft", legend=rownames(bfi)[1:3], lty=1, col=c("red", "blue", "green"), bty="n")



