library(bvenn)


### Name: bvenn
### Title: Simple alternative to Venn diagrams
### Aliases: bvenn

### ** Examples

bvenn(list(Set1 = sample(letters, 14), Set2 = sample(letters, 9)))
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 = sample(letters, 7)))

# Adding colors
bvenn(list(Set1 = sample(letters, 14), Set2 = sample(letters, 9)), colors = c("red",
"green", "yellow"))
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 =
sample(letters, 7)), colors = c("red", "blue", "yellow", "purple", "orange", "green",
"brown"))

# Adjust the triangle size
bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 12), Set3 =
sample(letters, 7)), colors = c("red", "blue", "yellow", "purple", "orange", "green",
"brown"), scale = 0.7)


# Combine several diagrams using grid graphics
vplayout = function(x, y){
	return(viewport(layout.pos.row = x, layout.pos.col = y))
}
grid.newpage()
pushViewport(viewport(layout = grid.layout(ncol = 2, nrow = 2)))
for(i in 1:2){
	for(j in 1:2){
		pushViewport(vplayout(i, j))
		bvenn(list(Set1 = sample(letters, 16), Set2 = sample(letters, 3+ 3*j), Set3 = sample(letters, 7)), add = TRUE, fontsize = 10)
		upViewport()
	}
}



