library(ape)


### Name: read.tree
### Title: Read Tree File in Parenthetic Format
### Aliases: read.tree phylo
### Keywords: manip IO

### ** Examples

### An extract from Sibley and Ahlquist (1990)
s <- "owls(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);"
cat(s, file = "ex.tre", sep = "\n")
tree.owls <- read.tree("ex.tre")
str(tree.owls)
tree.owls
tree.owls <- read.tree("ex.tre", keep.multi = TRUE)
tree.owls
names(tree.owls)
unlink("ex.tre") # delete the file "ex.tre"
### Only the first three species using the option `text'
TREE <- "((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3);"
TREE
tree.owls.bis <- read.tree(text = TREE)
str(tree.owls.bis)
tree.owls.bis

## tree with singleton nodes:
ts <- read.tree(text="((((a))),d);")
plot(ts, node.depth = 2) # the default will overlap the singleton node with the tip
nodelabels()

## skeleton tree with a singleton node:
tx <- read.tree(text = "(((,)),);")
plot(tx, node.depth = 2)
nodelabels()

## a tree with single quoted labels (the 2nd label is not quoted):
z <- "(('a: France, Spain (Europe)',b),'c: Australia [Outgroup]');"
tz <- read.tree(text = z)
plot(tz, font = 1)



