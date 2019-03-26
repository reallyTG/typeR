library(textshape)


### Name: column_to_rownames
### Title: Add a Column as Rownames
### Aliases: column_to_rownames

### ** Examples

state_dat <- data.frame(state.name, state.area, state.center, state.division)
column_to_rownames(state_dat)
column_to_rownames(state_dat, 'state.name')



