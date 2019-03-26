library(BNPdensity)


### Name: censor_code_rl
### Title: Censor code right-left
### Aliases: censor_code_rl
### Keywords: internal

### ** Examples

## The function is currently defined as
function (left, right) 
{
    test_ = function(k) {
        if (is.na(left[[k]]) & is.na(right[[k]])) 
            NA
        else if (is.na(left[[k]])) 
            2
        else if (is.na(right[[k]])) 
            0
        else if (left[[k]] == right[[k]]) 
            1
        else 3
    }
    sapply(seq_along(left), FUN = test_)
  }



