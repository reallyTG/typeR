library(hyper2)


### Name: ggol
### Title: Order statistics
### Aliases: ggol choose_losers choose_winners
###   general_grouped_order_likelihood order_likelihood

### ** Examples


W <- hyper2(pnames=letters[1:7])
W1 <- ggol(W, 'a', letters[2:6],'g')  # 24-element list
W2 <- ggol(W, 'b', letters[3:7],'a')  # 24-element list

like_single_list(rep(1/7,6),W1)
like_series(rep(1/7,6),list(W1,W2))

# Run 10 races:
r1 <- rrank(10,p=(7:1)/28)
colnames(r1) <- letters[1:7]

# Likelihood function for r1:
W <- order_likelihood(r1)

# Incorporate information from another (independent) observation:
W <- W + order_likelihood(sample(7))


# consistency check:
H <- hyper2(pnames=letters[1:5])
H <- H + order_likelihood(rrank(100,5:1)) # probs = 5/15,4/15,...,1/15
maxp(H)  # should be close to (5:1)/15







