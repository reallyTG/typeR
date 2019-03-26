library(VennDiagram)


### Name: draw.quad.venn
### Title: Draw a Venn Diagram with Four Sets
### Aliases: draw.quad.venn
### Keywords: hplot

### ** Examples

# Reference four-set diagram
venn.plot <- draw.quad.venn(
	area1 = 72,
	area2 = 86,
	area3 = 50,
	area4 = 52,
	n12 = 44,
	n13 = 27,
	n14 = 32,
	n23 = 38,
	n24 = 32,
	n34 = 20,
	n123 = 18,
	n124 = 17,
	n134 = 11,
	n234 = 13,
	n1234 = 6,
	category = c("First", "Second", "Third", "Fourth"),
	fill = c("orange", "red", "green", "blue"),
	lty = "dashed",
	cex = 2,
	cat.cex = 2,
	cat.col = c("orange", "red", "green", "blue")
	);

# Writing to file
tiff(filename = "Quad_Venn_diagram.tiff", compression = "lzw");
grid.draw(venn.plot);
dev.off();



