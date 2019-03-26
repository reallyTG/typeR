library(rcube)


### Name: is.solved
### Title: Testing if cube is solved
### Aliases: is.solved

### ** Examples

## Create new cube:
cube <- createCube(3)
## And it is solved:
is.solved(cube) # TRUE
## Now, test how many times repeating LFRB moves will bring back initial state:
cube <- twistCube(cube,'LFRB')
i <- 1
while(!is.solved(cube))
{
cube <- twistCube(cube,'LFRB')
i <- i + 1
}
print(i) # 315
## Check one more time if this is a solution:
is.solved(twistCube(cube,'LFRB',315)) # TRUE
## Check if really 314 moves and 316 moves don't give solution:
is.solved(twistCube(cube,'LFRB',314)) || is.solved(twistCube(cube,'LFRB',316)) # FALSE



