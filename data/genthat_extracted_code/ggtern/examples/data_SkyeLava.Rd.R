library(ggtern)


### Name: data_SkyeLava
### Title: Aichisons Skye Lavas
### Aliases: data_SkyeLava SkyeLava

### ** Examples


# Emulate & Enhance plot produced in Fig. 3, pg 7 of:
# Martin-Fernandez, J.; Chacon-Duran, J. & Mateu-Figueras, G.
# Updating on the kernel density estimation for compositional data 
# Proceedings of 17th Conference IASC-ERSS, Compstat, Roma,(Italy), 2006, 713-720

data(SkyeLava)
breaks  = c(.01,.05,.10,.25,.5,.75,.9,.95,.99)
ggtern(SkyeLava,aes(F,A,M)) + 
theme_bw() + 
theme_showarrows() + 
theme_latex() + 
theme(tern.panel.grid.minor = element_blank(),
      tern.panel.grid.major = element_line(linetype='dotted',color='darkgray'),
      tern.axis.text        = element_text(size=8)) + 
      geom_density_tern() + 
      geom_point() +
      limit_tern(breaks = breaks,
                 labels = sprintf("%.2f",breaks)) +
labs(title    = "Aphyric Skye Lavas",
     subtitle = "AFM Compositions of 23 samples",
     Tarrow = "A = Na_2O + K_2O",
     Larrow = "F = Fe_20_3",
     Rarrow = "M = MgO")



