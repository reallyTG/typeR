library(fastR2)


### Name: Pheno
### Title: FUSION type 2 diabetes study
### Aliases: Pheno FUSION1 FUSION2
### Keywords: datasets

### ** Examples


data(Pheno); data(FUSION1); data(FUSION2)
FUSION1m <- merge(FUSION1, Pheno, by = "id", all.x = FALSE, all.y = FALSE) 
xtabs( ~ t2d + genotype, data = FUSION1m) 
xtabs( ~ t2d + Gdose, data = FUSION1m) 
chisq.test( xtabs( ~ t2d + genotype, data = FUSION1m ) )
f1.glm <- glm( factor(t2d) ~ Gdose, data = FUSION1m, family = binomial) 
summary(f1.glm)




