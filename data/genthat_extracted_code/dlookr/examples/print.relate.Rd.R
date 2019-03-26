library(dlookr)


### Name: print.relate
### Title: Summarizing relate information
### Aliases: print.relate

### ** Examples

## Not run: 
##D # Generate data for the example
##D diamonds2 <- diamonds
##D diamonds2[sample(seq(NROW(diamonds2)), 250), "price"] <- NA
##D diamonds2[sample(seq(NROW(diamonds2)), 20), "clarity"] <- NA
##D 
##D # Binning the carat variable. default type argument is "quantile"
##D bin <- binning(diamonds2$carat)
##D 
##D # Print bins class object
##D bin
##D 
##D # Summarise bins class object
##D summary(bin)
## End(Not run)


# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# If the target variable is a categorical variable
categ <- target_by(carseats, US)

# If the variable of interest is a numarical variable
cat_num <- relate(categ, Sales)
cat_num
summary(cat_num)
plot(cat_num)

# If the variable of interest is a categorical variable
cat_cat <- relate(categ, ShelveLoc)
cat_cat
summary(cat_cat)
plot(cat_cat)

##---------------------------------------------------
# If the target variable is a categorical variable
num <- target_by(carseats, Sales)

# If the variable of interest is a numarical variable
num_num <- relate(num, Price)
num_num
summary(num_num)
plot(num_num)

# If the variable of interest is a categorical variable
num_cat <- relate(num, ShelveLoc)
num_cat
summary(num_cat)
plot(num_cat)



