library(deaR)


### Name: PFT1981
### Title: Data: Charnes, Cooper and Rhodes (1981).
### Aliases: PFT1981
### Keywords: datasets

### ** Examples

# Example 1. Replication of results in Charnes, Cooper and Rhodes (1981)
data("PFT1981")
# selecting DMUs in Project Follow Through (PFT)
PFT <- PFT1981[1:49,]
PFT <- read_data(PFT,
                 dmus=1,
                 inputs=2:6,
                 outputs=7:9 )
eval_pft <- model_basic(PFT,
                        orientation="io",
                        rts="crs")
eff_pft <- efficiencies(eval_pft)

# Example 2. Replication of results in Charnes, Cooper and Rhodes (1981)
data("PFT1981")
# selecting DMUs in Non-Follow Through (NFT)
NFT <- PFT1981[50:70,]
NFT <- read_data(NFT,
                 dmus=1,
                 inputs=2:6,
                 outputs=7:9 )
eval_nft <- model_basic(NFT,
                        orientation="io",
                        rts="crs")
eff_nft <- efficiencies(eval_nft)




