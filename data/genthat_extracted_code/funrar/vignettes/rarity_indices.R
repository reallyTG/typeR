## ------------------------------------------------------------------------
data("aravo", package = "ade4")

str(aravo)

## ------------------------------------------------------------------------
# Site-species matrix stored in aravo$spe
mat = as.matrix(aravo$spe)

mat[1:5, 1:5]

## ------------------------------------------------------------------------
library(funrar)

dat = matrix_to_stack(mat, "value", "site", "species")
head(dat)

# The reverse function is provided and gives the same original matrix
identical(as.numeric(stack_to_matrix(dat, "site", "species", "value")), as.numeric(mat))

# Removal of empty rows
dat = dat[which(dat$value > 0), ]

## ------------------------------------------------------------------------
tra = aravo$traits[, c("Height", "SLA", "N_mass")]
head(tra)

dist_mat = compute_dist_matrix(tra)
dist_mat[1:5, 1:5]

## ----distinctivenessComputation------------------------------------------
# Compute distinctiveness for each species on each site
di = distinctiveness(pres_matrix = mat,  # The site x species matrix
                     dist_matrix = dist_mat)  # Functional Distance matrix

di[1:5, 1:5]

## ----computeDi-----------------------------------------------------------
# Species should be character
dat$species = as.character(dat$species)

# Compute distinctiveness for each species on each site
di_df = distinctiveness_stack(com_df = dat,  # The site x species table
                              sp_col = "species",  # Name of the species column
                              com = "site",  # Name of the community column
                              abund = NULL,  # Relative abundances column (facultative)
                              dist_matrix = dist_mat)  # Functional Distance matrix

head(di_df)

## ----abundDi-------------------------------------------------------------
di_df = distinctiveness_stack(dat, "species", "site", "value", dist_mat)

head(di_df)

## ----scarcityComp--------------------------------------------------------
si = scarcity(pres_matrix = mat)

si[1:5, 1:5]

## ----siComp--------------------------------------------------------------
si_df = scarcity_stack(dat, "species", "site", "value")

head(si_df)

## ----uniqComp------------------------------------------------------------
ui = uniqueness(mat, dist_mat)

head(ui)

## ----uiComp--------------------------------------------------------------
ui_df = uniqueness_stack(dat, "species", dist_mat)

head(ui_df)
dim(ui_df[!duplicated(ui_df$species), ])

## ------------------------------------------------------------------------
ri = restrictedness(mat)

head(ri)

## ------------------------------------------------------------------------
# Species should be character
dat$site = as.character(dat$site)

ri_df = restrictedness_stack(dat, "species", "site")

head(ri_df)

## ------------------------------------------------------------------------
all_ind = funrar(mat, dist_mat, rel_abund = TRUE)

str(all_ind)

identical(all_ind$Ui, ui)
identical(all_ind$Di, di)
identical(all_ind$Ri, ri)
identical(all_ind$Si, si)

## ------------------------------------------------------------------------
library(ggplot2)
library(dplyr)

# Heatmap with distinctiveness values
ggplot(di_df, aes(species, site)) +
  geom_tile(aes(fill = Di), colour = "white") +
  scale_fill_gradient(low = "white", high = "steelblue")

# Density of distinctiveness values

quant = quantile(di_df$Di, probs = seq(0, 1, 0.10))
labels_quant = paste(names(quant)[-length(quant)], names(quant)[-1], sep = "-")
 
di_density = data.frame(density(di_df$Di)[c("x", "y")])
di_density = filter(di_density, x >= quant[[1]] & x <= quant[[length(quant)]])
di_density$quant = cut(di_density$x, breaks = quant)   
quant = quantile(di_df$Di, probs = seq(0, 1, 0.10))
labels_quant = paste(names(quant)[-length(quant)], names(quant)[-1], sep = "-")

di_dens = ggplot(data = di_density, aes(x = x, y = y)) +
  geom_area(aes(fill = quant)) +
  scale_fill_brewer(palette = "RdYlBu", labels = labels_quant,
                    name = "Quantile") +
  geom_line(size = 1) +
  xlab("Distinctiveness values") +
  ylab("Frequency") +
  ggtitle("Density of distinctiveness values") +
  theme_classic()

di_dens

# Density of scarcity values

quant = quantile(si_df$Si, probs = seq(0, 1, 0.10))
labels_quant = paste(names(quant)[-length(quant)], names(quant)[-1], sep = "-")
 
si_density = data.frame(density(si_df$Si)[c("x", "y")])
si_density = filter(si_density, x >= quant[[1]] & x <= quant[[length(quant)]])
si_density$quant = cut(si_density$x, breaks = quant)   
quant = quantile(si_df$Si, probs = seq(0, 1, 0.10))
labels_quant = paste(names(quant)[-length(quant)], names(quant)[-1], sep = "-")

si_dens = ggplot(data = si_density, aes(x = x, y = y)) +
  geom_area(aes(fill = quant)) +
  scale_fill_brewer(palette = "RdYlBu", labels = labels_quant,
                    name = "Quantile") +
  geom_line(size = 1) +
  xlab("Scarcity values") +
  ylab("Frequency") +
  ggtitle("Density of scarcity values") +
  theme_classic()

si_dens

# Regional rarity: restrictedness versus uniqueness
colnames(ri_df)[colnames(ri_df) == "sp"] = "species"
ri_ui <- inner_join(ri_df, ui_df, by = "species")

ggplot(ri_ui, aes(Ri, Ui)) +
  geom_point() + 
  theme_classic() 

