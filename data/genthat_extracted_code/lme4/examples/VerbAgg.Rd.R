library(lme4)


### Name: VerbAgg
### Title: Verbal Aggression item responses
### Aliases: VerbAgg
### Keywords: datasets

### ** Examples

str(VerbAgg)
## Show how  r2 := h(resp) is defined:
with(VerbAgg, stopifnot( identical(r2, {
     r <- factor(resp, ordered=FALSE); levels(r) <- c("N","Y","Y"); r})))

xtabs(~ item + resp, VerbAgg)
xtabs(~ btype + resp, VerbAgg)
round(100 * ftable(prop.table(xtabs(~ situ + mode + resp, VerbAgg), 1:2), 1))
person <- unique(subset(VerbAgg, select = c(id, Gender, Anger)))
require(lattice)
densityplot(~ Anger, person, groups = Gender, auto.key = list(columns = 2),
            xlab = "Trait Anger score (STAXI)")

if(lme4:::testLevel() >= 3) { ## takes about 15 sec
print(fmVA <- glmer(r2 ~ (Anger + Gender + btype + situ)^2 +
 		   (1|id) + (1|item), family = binomial, data =
		   VerbAgg), corr=FALSE)
}
                       ## much faster but less accurate
print(fmVA0 <- glmer(r2 ~ (Anger + Gender + btype + situ)^2 +
                    (1|id) + (1|item), family = binomial, data =
                    VerbAgg, nAGQ=0L), corr=FALSE)



