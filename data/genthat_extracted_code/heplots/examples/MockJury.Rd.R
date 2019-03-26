library(heplots)


### Name: MockJury
### Title: Effects Of Physical Attractiveness Upon Mock Jury Decisions
### Aliases: MockJury
### Keywords: datasets

### ** Examples

# manipulation check:  test ratings of the photos classified by Attractiveness
jury.mod1 <- lm( cbind(phyattr, happy, independent, sophisticated) ~ Attr, data=MockJury)
Anova(jury.mod1, test="Roy")
## 
## Type II MANOVA Tests: Roy test statistic
##      Df test stat approx F num Df den Df    Pr(>F)    
## Attr  2    1.7672   48.156      4    109 < 2.2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 

heplot(jury.mod1, main="HE plot for manipulation check")
pairs(jury.mod1)

if (require(candisc)) {
	jury.can <- candisc(jury.mod1)
	jury.can
	heplot(jury.can, main="Canonical HE plot")
}

# influence of Attr of photo and nature of crime on Serious and Years
jury.mod2 <- lm( cbind(Serious, Years) ~ Attr * Crime, data=MockJury)
Anova(jury.mod2, test="Roy")
heplot(jury.mod2)

# stepdown test (ANCOVA), controlling for Serious
jury.mod3 <- lm( Years ~ Serious + Attr * Crime, data=MockJury)
Anova(jury.mod3)

# need to consider heterogeneous slopes?
jury.mod4 <- lm( Years ~ Serious * Attr * Crime, data=MockJury)
anova(jury.mod3, jury.mod4)




