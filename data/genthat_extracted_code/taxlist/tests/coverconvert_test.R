# TODO:   Testing class coverconvert
# 
# Author: Miguel Alvarez
################################################################################

Test <- new("coverconvert")
validObject(Test)

Test$bb_1 <- list(
        value=c("+","1","2","3","4","5"),
        conversion=c(0,5,25,50,75,100)
                )
validObject(Test)

Test$bb_1 <- list(
        value=c("+","1","2","3","4","5"),
        conversion=paste(c(0,5,5,25,50,75,100))
)
validObject(Test)


# Valid object as example ------------------------------------------------------
Test <- new("coverconvert")
Test$bb_1 <- list(
        value=c("+","1","2","3","4","5"),
        conversion=c(0,5,5,25,50,75,100)
)
Test$bb_2 <- list(
        value=c("r","+","1","2m","2a","2b","3","4","5"),
        conversion=c(0,5,5,5,5,12.5,25,50,75,100)
)
validObject(Test)

# Test conversion
transform(c("+","10"), Test, from="bb_1")

transform(c("5","4","3","2","1","+"), Test, from="bb_1", rule="middle")



