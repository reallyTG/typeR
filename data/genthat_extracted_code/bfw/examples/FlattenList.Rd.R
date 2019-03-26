library(bfw)


### Name: FlattenList
### Title: Flatten List
### Aliases: FlattenList

### ** Examples

li <- list(LETTERS[1:3],
           list(letters[1:3],
                list(LETTERS[4:6])),
           DEF = letters[4:6],
           LETTERS[1:3],
           list() # Emtpy list
)
print(li)
# [[1]]
# [1] "A" "B" "C"
#
# [[2]]
# [[2]][[1]]
# [1] "a" "b" "c"
#
# [[2]][[2]]
# [[2]][[2]][[1]]
# [1] "D" "E" "F"
#
#
#
# $DEF
# [1] "d" "e" "f"
#
# [[4]]
# [1] "A" "B" "C"
#
# [[5]]
# list()
FlattenList(li)
# [[1]]
# [1] "A" "B" "C"
#
# [[2]]
# [1] "a" "b" "c"
#
# [[3]]
# [1] "D" "E" "F"
#
# [[4]]
# [1] "d" "e" "f"



