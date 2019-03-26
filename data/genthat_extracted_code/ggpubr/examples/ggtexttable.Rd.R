library(ggpubr)


### Name: ggtexttable
### Title: Draw a Textual Table
### Aliases: ggtexttable ttheme colnames_style rownames_style tbody_style
###   table_cell_font table_cell_bg

### ** Examples

# data
df <- head(iris)

# Default table
# Remove row names using rows = NULL
ggtexttable(df, rows = NULL)

# Blank theme
ggtexttable(df, rows = NULL, theme = ttheme("blank"))

# classic theme
ggtexttable(df, rows = NULL, theme = ttheme("classic"))

# minimal theme
ggtexttable(df, rows = NULL, theme = ttheme("minimal"))

# Medium blue (mBlue) theme
ggtexttable(df, rows = NULL, theme = ttheme("mBlue"))


# Customize the table as you want
ggtexttable(df, rows = NULL,
           theme = ttheme(
             colnames.style = colnames_style(color = "white", fill = "#8cc257"),
             tbody.style = tbody_style(color = "black", fill = c("#e8f3de", "#d3e8bb"))
           )
)

# Use RColorBrewer palette
# Provide as many fill color as there are rows in the table body, here nrow = 6
ggtexttable(df,
           theme = ttheme(
             colnames.style = colnames_style(fill = "white"),
             tbody.style = tbody_style(fill = get_palette("RdBu", 6))
           )
)

# Text justification
#::::::::::::::::::::::::::::::::::::::::::::::
# Default is "centre" for the body and header, and "right" for the row names.
# Left justification: hjust=0, x=0.1
# Right justification: hjust=1, x=0.9
tbody.style = tbody_style(color = "black",
   fill = c("#e8f3de", "#d3e8bb"), hjust=1, x=0.9)
ggtexttable(head(iris), rows = NULL,
           theme = ttheme(
             colnames.style = colnames_style(color = "white", fill = "#8cc257"),
             tbody.style = tbody.style
           )
)

# Access and modify the font and
# the background of table cells
# :::::::::::::::::::::::::::::::::::::::::::::
tab <- ggtexttable(head(iris), rows = NULL,
                  theme = ttheme("classic"))
tab <- table_cell_font(tab, row = 3, column = 2,
                      face = "bold")
tab <- table_cell_bg(tab, row = 4, column = 3, linewidth = 5,
                    fill="darkolivegreen1", color = "darkolivegreen4")
tab


# Combine density plot and summary table
#:::::::::::::::::::::::::::::::::::::
# Density plot of "Sepal.Length"
density.p <- ggdensity(iris, x = "Sepal.Length",
                      fill = "Species", palette = "jco")

# Draw the summary table of Sepal.Length
# Descriptive statistics by groups
stable <- desc_statby(iris, measure.var = "Sepal.Length",
                     grps = "Species")
stable <- stable[, c("Species", "length", "mean", "sd")]
stable.p <- ggtexttable(stable, rows = NULL,
                       theme = ttheme("mOrange"))

# Arrange the plots on the same page
ggarrange(density.p, stable.p,
         ncol = 1, nrow = 2,
         heights = c(1, 0.5))




