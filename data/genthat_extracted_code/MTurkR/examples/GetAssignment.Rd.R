library(MTurkR)


### Name: GetAssignment
### Title: Get Assignment(s)
### Aliases: GetAssignment GetAssignments assignment assignments
### Keywords: Assignments

### ** Examples

## Not run: 
##D # get an assignment
##D GetAssignment(assignments="26XXH0JPPSI23H54YVG7BKLEXAMPLE")
##D # get all assignments for a HIT
##D GetAssignment(hit="2MQB727M0IGF304GJ16S1F4VE3AYDQ", return.all=TRUE)
##D # get all assignments for a HITType
##D GetAssignment(hit.type="2FFNCWYB49F9BBJWA4SJUNST5OFSOW",
##D               return.all=FALSE, pagenumber="1", pagesize="50")
##D # get all assignments for an online batch from the RUI
##D GetAssignment(annotation="BatchId:78382;")
## End(Not run)



