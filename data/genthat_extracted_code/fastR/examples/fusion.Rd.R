library(fastR)


### Name: pheno
### Title: FUSION type 2 diabetes study
### Aliases: pheno fusion1 fusion2
### Keywords: datasets

### ** Examples


data(pheno); data(fusion1); data(fusion2)
fusion1m <- merge(fusion1, pheno, by="id", all.x=FALSE, all.y=FALSE) 
xtabs(~t2d + genotype, data=fusion1m) 
xtabs(~t2d + Gdose, data=fusion1m) 
chisq.test( xtabs( ~t2d + genotype, data=fusion1m ) )
f1.glm <- glm( factor(t2d) ~ Gdose, data=fusion1m, family=binomial) 
summary(f1.glm)




