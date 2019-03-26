library(BioGeoBEARS)


### Name: symbolic_cell_to_relprob_cell
### Title: Convert symbolic cell (a text equation) to relprob matrix (a
###   numeric value).
### Aliases: symbolic_cell_to_relprob_cell

### ** Examples

testval=1

charcell = "1*d+1*d"

# Right
cellval = symbolic_cell_to_relprob_cell(charcell, cellsplit="yadda",
mergesym="", d=0.1, e=0.01)
cellval

# Wrong
cellval = symbolic_cell_to_relprob_cell(charcell, cellsplit="\\+",
mergesym="*", d=0.1, e=0.01)
cellval

# Right
cellval = symbolic_cell_to_relprob_cell(charcell, cellsplit="\\+",
mergesym="+", d=0.1, e=0.01)
cellval



