library(ggtern)


### Name: data_Fragments
### Title: Grantham and Valbel Rock Fragment Data
### Aliases: data_Fragments Fragments

### ** Examples

data(Fragments)
ggtern(Fragments,aes(Qm+Qp,Rf,M,colour=Sample)) +
  geom_density_tern(h=2,aes(fill=..level..),
  expand=0.75,alpha=0.5,bins=5) + 
  geom_point(aes(shape=Position,size=Relief)) + 
  theme_bw(base_size=8) + 
  theme_showarrows() + 
  custom_percent('%') + 
  labs(title = "Grantham and Valbel Rock Fragment Data",
       x = "Q_{m+p}", xarrow = "Quartz (Multi + Poly)",
       y = "R_f",     yarrow = "Rock Fragments",
       z = "M",       zarrow = "Mica") + 
  theme_latex() + 
  facet_wrap(~Sample,nrow=2)



