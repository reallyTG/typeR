library(data.tree)


### Name: Set
### Title: Traverse a Tree and Assign Values
### Aliases: Set

### ** Examples

data(acme)
acme$Set(departmentId = 1:acme$totalCount, openingHours = NULL, traversal = "post-order")
acme$Set(head = c("Jack Brown", 
                  "Mona Moneyhead", 
                  "Dr. Frank N. Stein", 
                  "Eric Nerdahl"
                  ),
         filterFun = function(x) !x$isLeaf
        )
print(acme, "departmentId", "head")
 



