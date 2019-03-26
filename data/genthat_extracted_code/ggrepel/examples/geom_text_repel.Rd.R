library(ggrepel)


### Name: geom_label_repel
### Title: Repulsive textual annotations.
### Aliases: geom_label_repel geom_text_repel

### ** Examples


p <- ggplot(mtcars,
  aes(wt, mpg, label = rownames(mtcars), colour = factor(cyl))) +
  geom_point()

# Avoid overlaps by repelling text labels
p + geom_text_repel()
# Labels with background
p + geom_label_repel()

## Not run: 
##D p + geom_text_repel(family = "Times New Roman",
##D   box.padding = 0.5)
##D 
##D # Add aesthetic mappings
##D p + geom_text_repel(aes(alpha=wt, size=mpg))
##D p + geom_label_repel(aes(fill=factor(cyl)), colour="white", segment.colour="black")
##D 
##D # Draw all line segments
##D p + geom_text_repel(min.segment.length = 0)
##D 
##D # Omit short line segments (default behavior)
##D p + geom_text_repel(min.segment.length = 0.5)
##D 
##D # Omit all line segments
##D p + geom_text_repel(segment.colour = NA)
##D 
##D # Repel just the labels and totally ignore the data points
##D p + geom_text_repel(point.padding = NA)
##D 
##D # Hide some of the labels, but repel from all data points
##D mtcars$label <- rownames(mtcars)
##D mtcars$label[1:15] <- ""
##D p + geom_text_repel(data = mtcars, aes(wt, mpg, label = label))
##D 
##D # Nudge the starting positions
##D p + geom_text_repel(nudge_x = ifelse(mtcars$cyl == 6, 1, 0),
##D                     nudge_y = ifelse(mtcars$cyl == 6, 8, 0))
##D 
##D # Change the text size
##D p + geom_text_repel(aes(size = wt))
##D # Scale height of text, rather than sqrt(height)
##D p + geom_text_repel(aes(size = wt)) + scale_radius(range = c(3,6))
##D 
##D # You can display expressions by setting parse = TRUE.  The
##D # details of the display are described in ?plotmath, but note that
##D # geom_text_repel uses strings, not expressions.
##D p + geom_text_repel(aes(label = paste(wt, "^(", cyl, ")", sep = "")),
##D   parse = TRUE)
##D 
##D # Add a text annotation
##D p +
##D   geom_text_repel() +
##D   annotate(
##D     "text", label = "plot mpg vs. wt",
##D     x = 2, y = 15, size = 8, colour = "red"
##D   )
##D 
##D # Add arrows
##D p +
##D   geom_point(colour = "red") +
##D   geom_text_repel(
##D     arrow = arrow(length = unit(0.02, "npc")),
##D     box.padding = 1
##D   )
##D 
## End(Not run)



