library(ggsolvencyii)


### Name: geom_sii_risksurface
### Title: geom_sii_risksurface
### Aliases: geom_sii_risksurface

### ** Examples

## dataset human readable
library(ggsolvencyii)
library(ggplot2)
t <- tidyr::spread(data = sii_z_ex1_data, key = description, value = value)
t <- as.data.frame(t)
t <- t[order(t$id),]
t <- dplyr::select( t, id, time, comparewithid, ratio, SCR, dplyr::everything())
t[1:3 ,1:8]

ggplot() +
geom_sii_risksurface(
    data = sii_z_ex1_data[sii_z_ex1_data$id == 1, ],
mapping = aes(x = time,
                  y = ratio,
                  id = id,
                  value = value,
                  description = description,
                  color = description,
                  fill = description
                   ) ) +
theme_bw() +
scale_fill_manual(name = "Risks",values = sii_x_fillcolors_sf16_eng) +
scale_color_manual(name = "Risks",values = sii_x_edgecolors_sf16_eng)

ggplot() +
 geom_sii_risksurface(
   data = sii_z_ex2_data,
   mapping = aes(x = time, y = ratio, id = id, value = value,
                 description = description,
                 # color = description,
                 fill = description
                 ),
   color = "black",
   levelmax = sii_levelmax_sf16_993) +
theme_bw() +
scale_fill_manual(name = "Risks",values = sii_x_fillcolors_sf16_eng) # +
# scale_color_manual(name = "Risks",values = sii_x_edgecolors_sf16_eng)



ggplot() +
 geom_sii_risksurface(data = sii_z_ex1_data[sii_z_ex1_data$id == 1, ],
       mapping = ggplot2::aes(x = time,
                              y = ratio,
                              ## x and y could for example be
                              ## longitude and latitude
                              ## in combination with plotted map
                              value = value,
                              id = id,
                              description = description,
                              fill = description, ## optional
                              color = description  ## optional
                              ),
           ## all parameters are shown here,
           ## the values behind the outcommented are the default values
             ## how and what
               ## structure = sii_structure_sf16_eng,
               ## plotdetails = NULL,
             ## grouping
               # levelmax = 99,
               # aggregatesuffix = "other",
             ## scaling
               # maxscrvalue =  NULL,
               # scalingx = 1,
               # scalingy = 1,
             ## rotation and squared
               # rotationdegrees = NULL,
               # rotationdescription = NULL,
               # squared = FALSE,
             ## cosmetic
               lwd = 0.25,
               # alpha = 1
       ) +
 theme_bw() +
 scale_fill_manual(name = "risks", values = sii_z_ex1_fillcolors) +
 scale_color_manual(name = "risks", values = sii_z_ex1_edgecolors)



