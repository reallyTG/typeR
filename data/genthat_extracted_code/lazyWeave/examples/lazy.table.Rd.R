library(lazyWeave)


### Name: lazy.table
### Title: Tables in LaTeX
### Aliases: lazy.table

### ** Examples

## Not run: 
##D #*** Example 1: Simple Table
##D tab.text <- lazy.table(mtcars[, c(1, 2, 4, 6)], align="right", 
##D                        cborder=c(0, 4), rborder=c(0, nrow(mtcars)))
##D 
##D lazy.write(
##D   lazy.file.start(),
##D   tab.text,
##D   lazy.file.end(),
##D   OutFile="Example 1.tex")
##D   
##D unlink("Example 1.tex")
##D 
##D #*** Example 2: Complex Table
##D person <- c("Rachel", "John", "Elizabeth", "George", "Ryan")
##D veg <- c("", "x", "x", "", "x")
##D meat <- c("x", "", "", "x", "")
##D soup <- c("x", "", "x", "x", "")
##D salad <- c("", "x", "", "", "x")
##D ice <- c("", "x", "x", "x", "")
##D cake <- c("x", "", "", "", "x")
##D 
##D dinner <- cbind(person, veg, meat, soup, salad, ice, cake)
##D colnames(dinner) <- c("Name", "Vegetarian", "Meat", 
##D                       "Soup", "Salad", "Ice Cream", "Cake")
##D 
##D tab1 <- lazy.table(c("", "Entree", "Side", "Dessert"), 
##D                    cspan=c(1, 2, 2, 2),
##D                    rborder=c(0, 0, 1), rbspan=2:7, 
##D                    caption="Dinner Orders", close=FALSE)
##D tab2 <- lazy.table(colnames(dinner), 
##D                    align=c("left", rep("center", 6)),
##D                    cborder=c(3, 5),
##D                    open=FALSE, close=FALSE)
##D tab3 <- lazy.table(dinner, 
##D                    align=c("left", rep("center", 6)),
##D                    cborder=c(1, 3, 5),
##D                    rborder=c(0, nrow(dinner)), open=FALSE)
##D 
##D lazy.write(
##D   lazy.file.start(),
##D   tab1, tab2, tab3,
##D   lazy.file.end(),
##D   OutFile="Example 2.tex")
##D   
##D unlink("Example 2.tex")
## End(Not run)




