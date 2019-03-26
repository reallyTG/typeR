library(MEMSS)


### Name: Assay
### Title: Bioassay on Cell Culture Plate
### Aliases: Assay
### Keywords: datasets

### ** Examples

str(Assay)
m1 <- lmer(logDens ~ sample * dilut + (1|Block) + (1|Block:sample) +
           (1|Block:dilut), Assay, verbose = TRUE)
print(m1, corr = FALSE)
anova(m1)
m2 <- lmer(logDens ~ sample + dilut + (1|Block) + (1|Block:sample) +
           (1|Block:dilut), Assay, verbose = TRUE)
print(m2, corr = FALSE)
anova(m2)
m3 <- lmer(logDens ~ sample + dilut + (1|Block) + (1|Block:sample),
           Assay, verbose = TRUE)
print(m3, corr = FALSE)
anova(m3)
anova(m2, m3)



