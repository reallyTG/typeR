library(alakazam)


### Name: DEFAULT_COLORS
### Title: Default colors
### Aliases: DEFAULT_COLORS DNA_COLORS IG_COLORS TR_COLORS
### Keywords: datasets

### ** Examples

# IG_COLORS as an isotype color set for ggplot
isotype <- c("IgG", "IgM", "IgM", "IgA")
db <- data.frame(x=1:4, y=1:4, iso=isotype)
g1 <- ggplot(db, aes(x=x, y=y, color=iso)) + 
    scale_color_manual(name="Isotype", values=IG_COLORS) +
    geom_point(size=10)
plot(g1)

# DNA_COLORS to translate nucleotide values to a vector of colors 
# for use in base graphics plots
seq <- c("A", "T", "T", "C")
colors <- translateStrings(seq, setNames(names(DNA_COLORS), DNA_COLORS))
plot(1:4, 1:4, col=colors, pch=16, cex=6)




