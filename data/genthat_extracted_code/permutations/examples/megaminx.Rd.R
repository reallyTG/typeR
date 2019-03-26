library(permutations)


### Name: megaminx
### Title: megaminx
### Aliases: megaminx megaminx_colours W Pu DY DB R DG LG O LB LY Pi Gy
### Keywords: datasets

### ** Examples


data(megaminx)
megaminx
megaminx^5  # should be the identity
inverse(megaminx)  # turn each face anticlockwise


megaminx_colours[permprod(megaminx)]  # risky but elegant...

W    # turn the White face one click clockwise (colour names as per the
     # table above)


megaminx_colours[as.word(W,129)]      # it is safer to ensure a size-129 word;
megaminx_colours[as.word(W)]          # but the shorter version will work


# Now some superflip stuff:

X <- W * Pu^(-1) * W * Pu^2 * DY^(-2) 
Y <- LG^(-1) * DB^(-1) * LB * DG      
Z <- Gy^(-2) * LB * LG^(-1) * Pi^(-1) * LY^(-1)


sjc3 <- (X^6)^Y * Z^9  # superflip (Jeremy Clark)


p1 <- (DG^2 * W^4 * DB^3 * W^3 * DB^2 * W^2 * DB^2 * R * W * R)^3
m1 <- p1^(Pi^3)

p2 <- (O^2 * LG^4 * DB^3 * LG^3 * DB^2 * LG^2 * DB^2 * DY * LG * DY)^3
m2 <- p2^(DB^2)

p3 <- (LB^2 * LY^4 * Gy * Pi^3 * LY * Gy^4)^3
m3 <- p3^LB

# m1,m2 are 32 moves, p3 is 20, total = 84

stopifnot(m1+m2+m3==sjc3)







