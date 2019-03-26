library(tcR)


### Name: vis.group.boxplot
### Title: Boxplot for groups of observations.
### Aliases: vis.group.boxplot

### ** Examples

## Not run: 
##D names(immdata)  # "A1" "A2" "B1" "B2" "C1" "C2"
##D # Plot a boxplot for V-usage for each plot
##D # three boxplots for each group.
##D vis.group.boxplot(freq.Vb(immdata),
##D    list(A = c('A1', 'A2'), B = c('B1', 'B2'), C = c('C1', 'C2')),
##D    c('V segments', 'Frequency'))
##D 
##D data(twb)
##D ov <- repOverlap(twb)
##D sb <- matrixSubgroups(ov, list(tw1 = c('Subj.A', 'Subj.B'), tw2 = c('Subj.C', 'Subj.D')));
##D vis.group.boxplot(sb)
## End(Not run)



