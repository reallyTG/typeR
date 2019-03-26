library(mirtCAT)


### Name: findNextItem
### Title: Find next CAT item
### Aliases: findNextItem

### ** Examples

## Not run: 
##D 
##D # test defined in mirtCAT help file, first example 
##D # equivalent to criteria = 'MI'
##D customNextItem <- function(design, person, test){
##D    item <- findNextItem(person=person, design=design, test=test,
##D                         criteria = 'MI')
##D    item
##D  }
##D    
##D response <- generate_pattern(mod, 1)
##D result <- mirtCAT(mo=mod, local_pattern = response, 
##D                   design = list(customNextItem=customNextItem))
##D                 
##D -----------------------------------------------------------
##D # direct manupulation of internal objects
##D CATdesign <- mirtCAT(df, mod, criteria = 'MI', design_elements = TRUE)
##D 
##D # returns number 1 in this case, since that's the starting item
##D findNextItem(CATdesign)
##D 
##D # determine next item if item 1 and item 10 were answered correctly, and Theta = 0.5
##D CATdesign <- updateDesign(CATdesign, items = c(1, 10), responses = c(1, 1), Theta = 0.5)
##D findNextItem(CATdesign)
##D findNextItem(CATdesign, all_index = TRUE) # all items rank in terms of most optimal
##D 
##D # alternatively, update the Theta using the Update.thetas definition in design
##D CATdesign$design@Update.thetas(CATdesign$design, CATdesign$person, CATdesign$test)
##D findNextItem(CATdesign)
##D 
##D 
##D #-------------------------------------------------------------
##D ## Integer programming example (e.g., shadow testing)
##D 
##D # find maximum information subject to constraints
##D #  sum(xi) <= 5               ### 5 or fewer items
##D #  x1 + x2 <= 1               ### items 1 and 2 can't be together
##D #  x4 == 0                    ### item 4 not included
##D #  x5 + x6 == 1               ### item 5 or 6 must be included, but not both
##D 
##D # constraint function
##D constr_fun <- function(design, person, test){
##D 
##D   # left hand side constrains
##D   #    - 1 row per constraint, and ncol must equal number of items
##D   mo <- extract.mirtCAT(test, 'mo')
##D   nitems <- extract.mirt(mo, 'nitems')
##D   lhs <- matrix(0, 4, nitems)
##D   lhs[1,] <- 1
##D   lhs[2,c(1,2)] <- 1
##D   lhs[3, 4] <- 1
##D   lhs[4, c(5,6)] <- 1
##D 
##D   # relationship direction
##D   dirs <- c("<=", "<=", '==', '==')
##D 
##D   #right hand side
##D   rhs <- c(5, 1, 0, 1)
##D 
##D   #all together
##D   constraints <- data.frame(lhs, dirs, rhs)
##D   constraints
##D }
##D 
##D #### CATdesign <- mirtCAT(..., design_elements = TRUE,
##D ###                       design = list(constr_fun=constr_fun))
##D 
##D #' # MI criteria value associated with each respective item
##D objective <- computeCriteria(CATdesign, criteria = 'MI')
##D 
##D # most optimal item, given constraints
##D findNextItem(CATdesign, objective=objective)
##D 
##D # all the items which solve the problem
##D findNextItem(CATdesign, objective=objective, all_index = TRUE)
##D 
##D ## within a customNextItem() definition the above code would look like
##D # customNextItem <- function(design, person, test){
##D #   objective <- computeCriteria(person=person, design=design, test=test,
##D #                                criteria = 'MI')
##D #   item <- findNextItem(person=person, design=design, test=test,
##D #                        objective=objective)
##D #   item
##D # }
##D 
## End(Not run)



