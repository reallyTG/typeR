library(lmfor)


### Name: recweib
### Title: Recovery of Weibull parameters of tree diameter distribution
###   using measured stand characteristics
### Aliases: recweib func.recweib
### Keywords: forest biometrics diameter distributions

### ** Examples

# Demonstration with 3 example stands.
# Example stand 1. Uneven-aged stand in Finland (Vesijako, Kailankulma, stand no 1):
G_ha<-17.0
N_ha<-1844
D<-7.9
DG<-19.6
DM<-8.1
DGM<-19.1
recweib(G_ha,N_ha,D,"A") #  1.066123,  8.099707
recweib(G_ha,N_ha,DG,"B") # 1.19316  8.799652
recweib(G_ha,N_ha,DM,"C") # 1.601795 10.18257
recweib(G_ha,N_ha,DGM,"D") # 1.095979 8.280063


# Example 2. Even aged stand in Finland (see Siipilehto & Mehtatalo, Fig 2):
G_ha<-9.6
N_ha<-949
D<-11.0
DG<-12.3
DM<-11.1
DGM<-12.4  
recweib(G_ha,N_ha,D,"A") # 4.465673 12.05919
recweib(G_ha,N_ha,DG,"B") # 4.463991 12.05912
recweib(G_ha,N_ha,DM,"C")  # 4.410773 12.05949
recweib(G_ha,N_ha,DGM,"D") # 4.448272 12.05924


# Example 3. Assumed peaked even aged stand (see Siipilehto & Mehtatalo, Fig 1):
G_ha<-10.0
N_ha<-1300
D<-9.89
DG<-10.0
DM<-9.89
DGM<-10.0  
recweib(G_ha,N_ha,D,"A")  #  34.542 10.04978
recweib(G_ha,N_ha,DG,"B") # 14.23261 10.22781
recweib(G_ha,N_ha,DM,"C") # 6.708882 10.44448
recweib(G_ha,N_ha,DGM,"D") # 24.45228 10.10607



