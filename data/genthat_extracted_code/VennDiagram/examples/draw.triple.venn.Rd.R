library(VennDiagram)


### Name: draw.triple.venn
### Title: Draw a Venn Diagram with Three Sets
### Aliases: draw.triple.venn
### Keywords: hplot

### ** Examples

# A simple three-set diagram
venn.plot <- draw.triple.venn(65, 75, 85,
 35, 15, 25, 5, c("First", "Second", "Third"));
grid.draw(venn.plot);
grid.newpage();

# A more complicated diagram
venn.plot <- draw.triple.venn(
	area1 = 65,
	area2 = 75,
	area3 = 85,
	n12 = 35,
	n23 = 15,
	n13 = 25,
	n123 = 5,
	category = c("First", "Second", "Third"),
	fill = c("blue", "red", "green"),
	lty = "blank",
	cex = 2,
	cat.cex = 2,
	cat.col = c("blue", "red", "green")
	);
grid.draw(venn.plot);
grid.newpage();

# Demonstrating an Euler diagram
venn.plot <- draw.triple.venn(20, 40, 60, 0, 0, 0, 0,
 c("First", "Second", "Third"), sep.dist = 0.1, rotation.degree = 30);

# Writing to file
tiff(filename = "Triple_Venn_diagram.tiff", compression = "lzw");
grid.draw(venn.plot);
dev.off();



