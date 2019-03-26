library(ggtern)


### Name: ggtern_labels
### Title: Change Axis labels and legend titles
### Aliases: ggtern_labels llab tlab rlab wlab tarrowlab larrowlab
###   rarrowlab ggtern-labels Tlab Llab Rlab Wlab zlab Tarrowlab Larrowlab
###   Rarrowlab

### ** Examples

data(Feldspar)
plot <- ggtern(data=Feldspar,aes(Ab,An,Or)) +  geom_point() + 
        xlab("ABC") + ylab("DEF") + zlab("GHI")

#Alternatives, and Arrow Label
plot + Tlab("TOP") + Llab("LHS") + Rlab("RHS") + 
  Tarrowlab("Top Arrow Label") + Larrowlab("Left Arrow Label") + Rarrowlab("Right Arrow Label") +
  theme_showarrows() + Wlab("WEIGHT")

#Demonstrate the use of the latex2exp integration, and seperate arrow labels.  
ggtern(data=Feldspar,aes(x=Ab,y=An,z=Or)) + 
labs( x       = "NaAlSi_3O_8",
      xarrow  = "Albite, NaAlSi_3O_8",
      y       = "(Na,K)AlSi_3O_8",
      yarrow  = "Anorthite (Na,K)AlSi_3O_8",
      z       = "KAlSi_3O_8",
      zarrow  = "Orthoclase KAlSi_3O_8") + 
theme_latex(TRUE) + 
geom_point() + 
theme_showarrows() + 
theme_clockwise() + 
weight_percent()



