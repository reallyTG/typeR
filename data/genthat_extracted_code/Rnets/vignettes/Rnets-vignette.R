## ---- echo = FALSE, results = 'hide', message = F------------------------
library(Rnets)

#Define the set of antimicrobials to include in the Rnet
ABX_LIST <- c('AMC', 'AXO', 'TIO', 'CIP', 'TET', 'STR', 'GEN', 'CHL', 'AZI')

## ------------------------------------------------------------------------
EC_all_L1Selection <- L1Selection(
            x = NARMS_EC_DATA, 
            L1_values = seq(0.05, 0.45, 0.05),
            n_b = 1500,
            vert = ABX_LIST,
            verbose = F
            )

summary(EC_all_L1Selection)

## ------------------------------------------------------------------------
#Estimate the Rnet
EC_all_Rnet <- Rnet(x = NARMS_EC_DATA, L1 =  0.15, vert = ABX_LIST)
                
#View Results
summary(EC_all_Rnet)

## ------------------------------------------------------------------------
EC_2008_Rnet <- Rnet(x = NARMS_EC_DATA, L1 =  0.15, vert = ABX_LIST, subset = expression (Year == 2008))

summary(EC_2008_Rnet)

## ------------------------------------------------------------------------
EC_byYear_Rnet <- Rnet(x = NARMS_EC_DATA, L1 =  0.15, vert = ABX_LIST, subset = 'Year')

summary(EC_byYear_Rnet)

## ------------------------------------------------------------------------
Rnets::V_ATTRS[1:10,]

## ------------------------------------------------------------------------
Assign_Vmetadata(EC_2008_Rnet, V_ATTRS, match_attr = 'Code', V_match_attr = 'name')

## ------------------------------------------------------------------------
Rnets::E_ATTRS

## ------------------------------------------------------------------------
E_CUTS <- c(0, 0.05, 0.10, 0.20, 1)
Assign_Emetadata(EC_2008_Rnet, E_ATTRS, match_attr = 'omega', e_cuts = E_CUTS)

## ------------------------------------------------------------------------
EC_2012_Rnet <- Rnet(NARMS_EC_DATA, L1 = 0.15, vert = ABX_LIST, subset = expression(Year == 2012))
plot(EC_2012_Rnet)

## ------------------------------------------------------------------------
plot(
  EC_2012_Rnet,
  edge.color = 'black',
  edge.lty = 2,
  vertex.shape = c('circle', 'square'),
  vertex.size = 30,
  vertex.color = 'cyan'
)

## ------------------------------------------------------------------------
plot(EC_2008_Rnet)


## ------------------------------------------------------------------------
plot.igraph(EC_2008_Rnet@R)

## ------------------------------------------------------------------------
plot(x = EC_2008_Rnet,
     vertex.color = 'red',
     edge.lty = '4313'
     )

## ----eval=FALSE----------------------------------------------------------
#  #Open a new tkplot window with the network 'EC_2008_Rnet'
#  tkplot(EC_2008_Rnet@R)
#  
#  #You can now click and drag the vertices on the canvas to create the layout desired.
#  
#  #The following code can be used to save the layout to use in subsequent plot() calls.
#  EC_2008_Rnet@layout <- tkcoords(1)
#  
#  plot(EC_2008_Rnet)

## ------------------------------------------------------------------------
EC_edge_heatmap <- Rnet_Heatmap(EC_byYear_Rnet, e_cuts = c(0, 0.05, 0.10, 0.20, 1.0))
image(EC_edge_heatmap)


## ------------------------------------------------------------------------
edge_density(EC_2008_Rnet@R)

## ------------------------------------------------------------------------
v_mem <- as.factor(V(EC_2008_Rnet@R)$Class)
Q <- modularity(x = EC_2008_Rnet@R, mem = v_mem)
Q

## ------------------------------------------------------------------------
Q_w <- modularity(x = EC_2008_Rnet@R, mem = v_mem, weights = E(EC_2008_Rnet@R)$omega)
Q_w

## ------------------------------------------------------------------------
signed_modularity(EC_2008_Rnet, membership = 'Class', weight = 'omega')

