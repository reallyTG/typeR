library(ggtern)


### Name: theme_latex
### Title: Parse Labels w Latex Markup
### Aliases: theme_latex theme_showlatex theme_nolatex theme_hidelatex

### ** Examples


#Demonstrate  without latex parsing
ggtern() + 
 theme_latex(FALSE) + 
 labs(title = '\\textit{Plot Title}')

#Same as before, but turn on the latex parsing
last_plot() + 
 theme_latex(TRUE)

#Demonstrate latex overriding the bold face
ggtern() + 
 labs(title = '\\textit{Plot Title}') + 
 theme_latex(TRUE) + 
 theme('plot.title' = element_text(face='bold'))

#Turn off latex parsing, bold title revealed
last_plot() + 
 theme_latex(FALSE)
 



