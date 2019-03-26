library(BrailleR)


### Name: ThreeFactors
### Title: A convenience function for a Three-way analysis
### Aliases: ThreeFactors

### ** Examples

TestData=data.frame(Resp=sample(54), expand.grid(F1=c("a","b","c"), 
    F2=c("d","e","f"), F3=c("g","h","i"), rep=c(1,2)))
attach(TestData)
ThreeFactors(Resp,F1,F2,F3)
detach(TestData)
rm(TestData)



