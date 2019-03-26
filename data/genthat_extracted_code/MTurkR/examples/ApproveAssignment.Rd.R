library(MTurkR)


### Name: ApproveAssignment
### Title: Approve Assignment(s)
### Aliases: ApproveAssignment ApproveAssignments approve
###   ApproveAllAssignments approveall
### Keywords: Assignments

### ** Examples

## Not run: 
##D # Approve one assignment
##D ApproveAssignment(assignments = "26XXH0JPPSI23H54YVG7BKLEXAMPLE")
##D 
##D # Approve multiple assignments with the same feedback
##D ApproveAssignment(assignments = c("26XXH0JPPSI23H54YVG7BKLEXAMPLE1",
##D                                   "26XXH0JPPSI23H54YVG7BKLEXAMPLE2"),
##D                   feedback = "Great work!")
##D 
##D 
##D # Approve all assignments for a given HIT
##D ApproveAllAssignments(hit = "2MQB727M0IGF304GJ16S1F4VE3AYDQ")
##D # Approve all assignments for a given HITType
##D ApproveAllAssignments(hit.type = "2FFNCWYB49F9BBJWA4SJUNST5OFSOW")
##D # Approve all assignments for a given batch from the RUI
##D ApproveAllAssignments(annotation="BatchId:78382;")
## End(Not run)



