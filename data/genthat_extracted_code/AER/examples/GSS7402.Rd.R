library(AER)


### Name: GSS7402
### Title: US General Social Survey 1974-2002
### Aliases: GSS7402
### Keywords: datasets

### ** Examples

## completed fertility subset
data("GSS7402", package = "AER")
gss40 <- subset(GSS7402, age >= 40)

## Chapter 1
## exploratory statistics
gss_kids <- prop.table(table(gss40$kids))
names(gss_kids)[9] <- "8+"

gss_zoo <- as.matrix(with(gss40, cbind(
  tapply(kids, year, mean),
  tapply(kids, year, function(x) mean(x <= 0)),
  tapply(education, year, mean))))
colnames(gss_zoo) <- c("Number of children",
  "Proportion childless", "Years of schooling")
gss_zoo <- zoo(gss_zoo, sort(unique(gss40$year)))

## visualizations instead of tables
barplot(gss_kids,
  xlab = "Number of children ever borne to women (age 40+)",
  ylab = "Relative frequencies")

library("lattice")
trellis.par.set(theme = canonical.theme(color = FALSE))
print(xyplot(gss_zoo[,3:1], type = "b", xlab = "Year"))


## Chapter 3, Example 3.14
## Table 3.1
gss40$nokids <- factor(gss40$kids <= 0, levels = c(FALSE, TRUE), labels = c("no", "yes"))
gss40$trend <- gss40$year - 1974
nokids_p1 <- glm(nokids ~ 1, data = gss40, family = binomial(link = "probit"))
nokids_p2 <- glm(nokids ~ trend, data = gss40, family = binomial(link = "probit"))
nokids_p3 <- glm(nokids ~ trend + education + ethnicity + siblings,
  data = gss40, family = binomial(link = "probit"))
lrtest(nokids_p1, nokids_p2, nokids_p3)


## Chapter 4, Figure 4.4
library("effects")
nokids_p3_ef <- effect("education", nokids_p3, xlevels = list(education = 0:20))
plot(nokids_p3_ef, rescale.axis = FALSE, ylim = c(0, 0.3))


## Chapter 8, Example 8.11
kids_pois <- glm(kids ~ education + trend + ethnicity + immigrant + lowincome16 + city16,
  data = gss40, family = poisson)
library("MASS")
kids_nb <- glm.nb(kids ~ education + trend + ethnicity + immigrant + lowincome16 + city16,
  data = gss40)
lrtest(kids_pois, kids_nb)


## More examples can be found in:
## help("WinkelmannBoes2009")



