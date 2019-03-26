library(trinROC)


### Name: roc.eda
### Title: Exploratory data analysis for a three-class ROC marker
### Aliases: roc.eda

### ** Examples

data(krebs)

# empirical EDA:
roc.eda(dat = krebs[,c(1,5)], type = "e", plotVUS = FALSE)

# equal data input via:
x <- with(krebs, krebs[trueClass=="healthy", 5])
y <- with(krebs, krebs[trueClass=="intermediate", 5])
z <- with(krebs, krebs[trueClass=="diseased", 5])
## Not run: 
##D    roc.eda(x, y, z, type = "e", sep.dens = TRUE)
## End(Not run)

data(cancer)
# trinormal EDA:
roc.eda(dat = cancer[,c(1,10)], type = "trin", plotVUS = FALSE)
# trinormal EDA with different plots:
## Not run: 
##D    roc.eda(dat = cancer[,c(1,5)], type = "t", sep.dens = TRUE, scatter = TRUE)
## End(Not run)



