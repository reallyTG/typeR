library(VennDiagram)


### Name: draw.single.venn
### Title: Draw a Venn Diagram with a Single Set
### Aliases: draw.single.venn
### Keywords: hplot

### ** Examples

# A simple single-set diagram
venn.plot <- draw.single.venn(100, "First");
grid.draw(venn.plot);
grid.newpage();

# A more complicated diagram
venn.plot <- draw.single.venn(
	area = 365,
	category = "All\nDays",
	lwd = 5,
	lty = "blank",
	cex = 3,
	label.col = "orange",
	cat.cex = 4,
	cat.pos = 180,
	cat.dist = -0.20,
	cat.col = "white",
	fill = "red",
	alpha = 0.15
	);
grid.draw(venn.plot);
grid.newpage();

# Writing to file
tiff(filename = "Single_Venn_diagram.tiff", compression = "lzw");
venn.plot <- draw.single.venn(100, "First", ind = FALSE);
grid.draw(venn.plot);
dev.off();



