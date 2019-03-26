library(cowplot)


### Name: draw_label
### Title: Draw a text label or mathematical expression.
### Aliases: draw_label

### ** Examples

# setup plot and a label (regression description)
p <- ggplot(mtcars, aes(mpg, disp)) + geom_line(color = "blue") + background_grid(minor = 'none')
c <- cor.test(mtcars$mpg, mtcars$disp, method = 'sp')
label <- substitute(paste("Spearman ", rho, " = ", estimate, ", P = ", pvalue),
                    list(estimate = signif(c$estimate, 2), pvalue = signif(c$p.value, 2)))

# Add label to plot, centered on {x,y} (in data coordinates)
p + draw_label(label, x = 20, y = 400)
# Add label to plot in data coordinates, flush-left at x, baseline at y.
p + draw_label(label, x = 20, y = 400, hjust = 0, vjust = 0)

# Add label to plot. Data coordinates, drawing rightward
# from x, with ascenders of text touching y.
p + draw_label(label, x = 20, y = 400, hjust = 0, vjust = 1)

# Add labels via ggdraw. Uses ggdraw coordinates.
# ggdraw coordinates default to xlim = c(0, 1), ylim = c(0, 1).
ggdraw(p) + draw_label("centered on 70% of x, 90% of y height", x = 0.7, y = 0.9)
labstr = "bottom left at {0%, 0%} of the SHEET, not the plot!"
p = ggdraw(p) + draw_label(labstr, x = 0, y = 0, hjust = 0, vjust = 0)
p = p + draw_label("top right at {1,1}", x = 1, y = 1, hjust = 1, vjust = 1)
p = p + draw_label("bottom left at {.4,.4}", x = 0.4, y = 0.4, hjust = 0, vjust = 0)
p + draw_label("centered on at {.5,.5}", x = 0.5, y = 0.5, hjust = 0.5, vjust = 0.5)



