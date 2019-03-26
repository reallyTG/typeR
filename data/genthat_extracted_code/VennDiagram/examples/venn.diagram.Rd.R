library(VennDiagram)


### Name: venn.diagram
### Title: Make a Venn Diagram
### Aliases: venn.diagram
### Keywords: hplot

### ** Examples

# Note: most examples are listed as dontrun to meet CRAN requirements, 
# but all should work as-is!

# compact and minimal notation
## Not run: 
##D venn.plot <- venn.diagram(
##D 	list(A = 1:150, B = 121:170), 
##D 	"Venn_2set_simple.tiff"
##D 	);
##D venn.plot <- venn.diagram(
##D 	list(A = 1:150, B = 121:170, C = 101:200), 
##D 	"Venn_3set_simple.tiff"
##D 	);
## End(Not run)

# a more elaborate two-set Venn diagram with title and subtitle
venn.plot <- venn.diagram(
	x = list(
		"A" = 1:100,
		"B" = 96:140
		),
	filename = "Venn_2set_complex.tiff",
	scaled = TRUE,
	ext.text = TRUE,
	ext.line.lwd = 2,
	ext.dist = -0.15,
	ext.length = 0.9,
	ext.pos = -4,
	inverted = TRUE,
	cex = 2.5,
	cat.cex = 2.5,
	rotation.degree = 45,
	main = "Complex Venn Diagram",
	sub = "Featuring: rotation and external lines",
	main.cex = 2,
	sub.cex = 1
	);

## Not run: 
##D # sample three-set Euler diagram
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		"Num A" = paste("Num", 1:100),
##D 		"Num B" = c(paste("Num", 61:70), paste("Num", 71:100)),
##D 		"Num C" = c(paste("Num", 41:60), paste("Num", 61:70))),
##D 	euler.d = TRUE,
##D 	filename = "Euler_3set_simple.tiff",
##D 	cat.pos = c(-20, 0, 20),
##D 	cat.dist = c(0.05, 0.05, 0.02),
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	reverse = TRUE
##D 	);
##D 
##D # sample three-set Euler diagram
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:10),
##D 		B = c(11:90),
##D 		C = c(81:90)
##D 		),
##D 	euler.d = TRUE,
##D 	filename = "Euler_3set_scaled.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = 0
##D 	);
## End(Not run)

# sample four-set Venn Diagram
A <- sample(1:1000, 400, replace = FALSE);
B <- sample(1:1000, 600, replace = FALSE);
C <- sample(1:1000, 350, replace = FALSE);
D <- sample(1:1000, 550, replace = FALSE);
E <- sample(1:1000, 375, replace = FALSE);

venn.plot <- venn.diagram(
	x = list(
		A = A,
		D = D,
		B = B,
		C = C
		),
	filename = "Venn_4set_pretty.tiff",
	col = "transparent",
	fill = c("cornflowerblue", "green", "yellow", "darkorchid1"),
	alpha = 0.50,
	label.col = c("orange", "white", "darkorchid4", "white", 
	"white", "white", "white", "white", "darkblue", "white", 
	"white", "white", "white", "darkgreen", "white"),
	cex = 1.5,
	fontfamily = "serif",
	fontface = "bold",
	cat.col = c("darkblue", "darkgreen", "orange", "darkorchid4"),
	cat.cex = 1.5,
	cat.pos = 0,
	cat.dist = 0.07,
	cat.fontfamily = "serif",
	rotation.degree = 270,
	margin = 0.2
	);

# sample five-set Venn Diagram
venn.plot <- venn.diagram(
	x = list(
		A = A,
		B = B,
		C = C,
		D = D,
		E = E
		),
	filename = "Venn_5set_pretty.tiff",
	col = "black",
	fill = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
	alpha = 0.50,
	cex = c(1.5, 1.5, 1.5, 1.5, 1.5, 1, 0.8, 1, 0.8, 1, 0.8, 1, 0.8,
	 1, 0.8, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 0.55, 1, 1, 1, 1, 1, 1.5),
	cat.col = c("dodgerblue", "goldenrod1", "darkorange1", "seagreen3", "orchid3"),
	cat.cex = 1.5,
	cat.fontface = "bold",
	margin = 0.05
	);

# Complex three-way Venn with labels & sub-/super-scripts	
venn.plot <- venn.diagram(
	x = list(
		I = c(1:60, 61:105, 106:140, 141:160, 166:175, 176:180, 181:205, 
		206:220),
		II = c(531:605, 476:530, 336:375, 376:405, 181:205, 206:220, 166:175, 
		176:180),
		III = c(61:105, 106:140, 181:205, 206:220, 221:285, 286:335, 336:375, 
		376:405)
		),
	category.names = c(
		expression( bold('A'['1: subscript']) ),
		expression( bold('B'^'2: going up') ),
		expression( paste(bold('C'^'3'), bold('X'['i' <= 'r'^'2']^'2') ) )
		),
	filename = 'Fig3-1_triple_labels_sub_and_superscripts.tiff',
	output = TRUE,
	height = 3000,
	width = 3000,
	resolution = 300,
	compression = 'lzw',
	units = 'px',
	lwd = 6,
	lty = 'blank',
	fill = c('yellow', 'purple', 'green'),
	cex = 3.5,
	fontface = "bold",
	fontfamily = "sans",
	cat.cex = 3,
	cat.fontface = "bold",
	cat.default.pos = "outer",
	cat.pos = c(-27, 27, 135),
	cat.dist = c(0.055, 0.055, 0.085),
	cat.fontfamily = "sans",
	rotation = 1
	);

# Complex 3-way Venn using expressions
venn.plot <- venn.diagram(
   x = list(
		"Num A" = paste("Num", 1:100),
		"Num B" = c(paste("Num", 61:70), paste("Num", 71:100)),
		"Num C" = c(paste("Num", 41:60), paste("Num", 61:70))),
	category.names = c(
		expression( bold('A'['1']) ),
		expression( bold('A'['2']) ),
		expression( bold('A'['3']) )
		),
	euler.d = TRUE,
	filename = "Fig3-2_Euler_3set_simple_with_subscripts.tiff",
	cat.pos = c(-20, 0, 20),
	cat.dist = c(0.05, 0.05, 0.02),
	cex = 2.5,
	cat.cex = 2.5,
	reverse = TRUE
	);

## Not run: 
##D # Example to print to screen
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 			sample1 = c(1:40),
##D 			sample2 = c(30:60)
##D 			),
##D 		filename = NULL
##D 		);
##D 
##D # Save picture to non-TIFF file type
##D # currently working on adding this functionality directly into venn.diagram
##D venn.plot <- venn.diagram(
##D 	x = list (
##D 		A = 1:10,
##D 		B = 6:25
##D 		),
##D 	filename = NULL
##D 	);
##D 
##D jpeg("venn_jpeg.jpg");
##D grid.draw(venn.plot);
##D dev.off();
##D 
## End(Not run)

#dontrun-starts-here
### NB: All figures from the paper can be run, but are turned off from
###     automatic execution to reduce burden on CRAN computing resources.
## Not run: 
##D # Figure 1A
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		Label = 1:100
##D 		),
##D 	filename = "1A-single_Venn.tiff",
##D 	col = "black",
##D 	lwd = 9,
##D 	fontface = "bold",
##D 	fill = "grey",
##D 	alpha = 0.75,
##D 	cex = 4,
##D 	cat.cex = 3,
##D 	cat.fontface = "bold",
##D 	);
##D 
##D # Figure 1B
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		X = 1:150,
##D 		Y = 121:180
##D 		),
##D 	filename = "1B-double_Venn.tiff",
##D 	lwd = 4,
##D 	fill = c("cornflowerblue", "darkorchid1"),
##D 	alpha = 0.75,
##D 	label.col = "white",
##D 	cex = 4,
##D 	fontfamily = "serif",
##D 	fontface = "bold",
##D 	cat.col = c("cornflowerblue", "darkorchid1"),
##D 	cat.cex = 3,
##D 	cat.fontfamily = "serif",
##D 	cat.fontface = "bold",
##D 	cat.dist = c(0.03, 0.03),
##D 	cat.pos = c(-20, 14)
##D 	);
##D 
##D # Figure 1C
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		R = c(1:70, 71:110, 111:120, 121:140),
##D 		B = c(141:200, 71:110, 111:120, 201:230),
##D 		G = c(231:280, 111:120, 121:140, 201:230)
##D 		),
##D 	filename = "1C-triple_Venn.tiff",
##D 	col = "transparent",
##D 	fill = c("red", "blue", "green"),
##D 	alpha = 0.5,
##D 	label.col = c("darkred", "white", "darkblue", "white",
##D 	 "white", "white", "darkgreen"),
##D 	cex = 2.5,
##D 	fontfamily = "serif",
##D 	fontface = "bold",
##D 	cat.default.pos = "text",
##D 	cat.col = c("darkred", "darkblue", "darkgreen"),
##D 	cat.cex = 2.5,
##D 	cat.fontfamily = "serif",
##D 	cat.dist = c(0.06, 0.06, 0.03),
##D 	cat.pos = 0
##D 	);
##D 
##D # Figure 1D
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		I = c(1:60, 61:105, 106:140, 141:160, 166:175, 176:180, 181:205, 
##D 		206:220),
##D 		IV = c(531:605, 476:530, 336:375, 376:405, 181:205, 206:220, 166:175, 
##D 		176:180),
##D 		II = c(61:105, 106:140, 181:205, 206:220, 221:285, 286:335, 336:375, 
##D 		376:405),
##D 		III = c(406:475, 286:335, 106:140, 141:160, 166:175, 181:205, 336:375, 
##D 		476:530)
##D 		),
##D 	filename = "1D-quadruple_Venn.tiff",
##D 	col = "black",
##D 	lty = "dotted",
##D 	lwd = 4,
##D 	fill = c("cornflowerblue", "green", "yellow", "darkorchid1"),
##D 	alpha = 0.50,
##D 	label.col = c("orange", "white", "darkorchid4", "white", "white", "white",
##D 	 "white", "white", "darkblue", "white",
##D 	  "white", "white", "white", "darkgreen", "white"),
##D 	cex = 2.5,
##D 	fontfamily = "serif",
##D 	fontface = "bold",
##D 	cat.col = c("darkblue", "darkgreen", "orange", "darkorchid4"),
##D 	cat.cex = 2.5,
##D 	cat.fontfamily = "serif"
##D 	);
##D 
##D # Figure 2-1
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = 1:105,
##D 		B = 101:115
##D 		),
##D 	filename = "2-1_special_case_ext-text.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = c(-20, 20),
##D 	ext.line.lty = "dotted",
##D 	ext.line.lwd = 2,
##D 	ext.pos = 12,
##D 	ext.dist = -0.12,
##D 	ext.length = 0.85
##D 	);
##D 
##D # Figure 2-2
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = 1:100,
##D 		B = 1:10
##D 		),
##D 	filename = "2-2_special_case_pairwise-inclusion.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = 0
##D 	);
##D 
##D # Figure 2-3
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = 1:150,
##D 		B = 151:250
##D 		),
##D 	filename = "2-3_special_case_pairwise-exclusion.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = c(0, 0),
##D 	cat.dist = 0.05
##D 	);
##D 
##D # Figure 2-4
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:50, 101:140, 141:160, 161:170),
##D 		B = c(171:230, 101:140, 161:170, 291:320),
##D 		C = c(141:160, 161:170, 291:320)
##D 		),
##D 	filename = "2-4_triple_special_case-001.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.dist = c(0.05, 0.05, -0.1)
##D 	);
##D 
##D # Figure 2-5
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:100),
##D 		B = c(61:70, 71:100),
##D 		C = c(41:60, 61:70)
##D 		),
##D 	filename = "2-5_triple_special_case-012AA.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = c(-25, 0, 30),
##D 	cat.dist = c(0.05, 0.05, 0.02)
##D 	);
##D 
##D # Figure 2-6
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:90),
##D 		B = c(1:25),
##D 		C = c(1:5)
##D 		),
##D 	filename = "2-6_triple_special_case-022AAAO.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = 0,
##D 	cat.dist = c(0.03, 0.03, 0.01)
##D 	);
##D 
##D # Figure 2-7
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:20),
##D 		B = c(21:80),
##D 		C = c(81:210)
##D 		),
##D 	filename = "2-7_triple_special_case-100.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.dist = 0.05
##D 	);
##D 
##D # Figure 2-8
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:80),
##D 		B = c(41:150),
##D 		C = c(71:100)
##D 		),
##D 	filename = "2-8_triple_special_case-011A.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.dist = c(0.07, 0.07, 0.02),
##D 	cat.pos = c(-20, 20, 20)
##D 	);
##D 
##D # Figure 2-9
##D venn.plot <- venn.diagram(
##D 	x = list(
##D 		A = c(1:10),
##D 		B = c(11:90),
##D 		C = c(81:90)
##D 		),
##D 	filename = "2-9_triple_special_case-121AO.tiff",
##D 	cex = 2.5,
##D 	cat.cex = 2.5,
##D 	cat.pos = 0,
##D 	cat.dist = c(0.04, 0.04, 0.02),
##D 	reverse = TRUE
##D 	);
##D 
##D #dontrun-ends-here
## End(Not run)



