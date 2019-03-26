library(quhomology)


### Name: down_action
### Title: The down action for a birack or biquandle.
### Aliases: down_action
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Example for version with function (for a dihedral quandle)
down_action <- function (a, b, k){

    result <- (2 * b - a)%%k
    return(as.integer(result))
}


##Example for matrix lookup (for commutative quandle over S_3, in which case k = 6)
down_action <- function (a, b, k){
    #first define the action matrix
    action_matrix <- rbind(c(0,0,0,0,0,0),c(1,1,5,5,2,2),c(2,5,2,1,5,1),
    c(3,4,4,3,4,4),c(4,3,3,3,4,3),c(5,2,1,2,1,5))
    result <-action_matrix[a + 1, b + 1]
    return(as.integer(result))
}

##example for quandles/racks
down_action <- function (a, b, k){

    return(a)
}




