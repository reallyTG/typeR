library(VennDiagram)


### Name: draw.pairwise.venn
### Title: Draw a Venn Diagram with Two Sets
### Aliases: draw.pairwise.venn
### Keywords: hplot

### ** Examples

# A simple two-set diagram
venn.plot <- draw.pairwise.venn(100, 70, 30, c("First", "Second"));
grid.draw(venn.plot);
grid.newpage();

# Same diagram as above, but without scaling
venn.plot <- draw.pairwise.venn(100, 70, 30, c("First", "Second"), scaled = FALSE);
grid.draw(venn.plot);
grid.newpage();

# A more complicated diagram Demonstrating external area labels
venn.plot <- draw.pairwise.venn(
	area1 = 100,
	area2 = 70,
	cross.area = 68,
	category = c("First", "Second"),
	fill = c("blue", "red"),
	lty = "blank",
	cex = 2,
	cat.cex = 2,
	cat.pos = c(285, 105),
	cat.dist = 0.09,
	cat.just = list(c(-1, -1), c(1, 1)),
	ext.pos = 30,
	ext.dist = -0.05,
	ext.length = 0.85,
	ext.line.lwd = 2,
	ext.line.lty = "dashed"
	);
grid.draw(venn.plot);
grid.newpage();

# Demonstrating an Euler diagram
venn.plot <- draw.pairwise.venn(
	area1 = 100,
	area2 = 70,
	cross.area = 0,
	category = c("First", "Second"),
	cat.pos = c(0, 180),
	euler.d = TRUE,
	sep.dist = 0.03,
	rotation.degree = 45
	);

# Writing to file
tiff(filename = "Pairwise_Venn_diagram.tiff", compression = "lzw");
grid.draw(venn.plot);
dev.off();



