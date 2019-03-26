library(weirs)


### Name: weir3a5.broadcrest
### Title: Compute Open-Channel Flow over Broad-Crested Weir by TWRI3A5
### Aliases: weir3a5.broadcrest
### Keywords: misc

### ** Examples


# Simple, scalar inputs and results
weir.broadcrest(0.5, b=8, B=11, P=6, L=3.25);

# Vector of heads
weir.broadcrest(c(0.5,0.4,0.3), b=8, B=11, P=6, L=3.25);

# Vector of heads and "effective weir lengths"
# Nomograph TWRI3A5-fig7 is being tested here.
weir.broadcrest(  c(0.51, 0.53, 0.70),
                L=c(1,    1.1,  1.20), b=6.18, B=7.84, P=1.13);

# User specified contraction--superceds 8/11
# Nomograph TWRI3A5-fig3 is being tested here.
weir.broadcrest(0.5, b=8, B=11, contractratio=9/11, P=6, L=3.25);
weir.broadcrest(0.5, b=8, B=11, P=6, L=3.25); # compare to previous

# Randomly pick contraction ratios to span the nomograph
# Nomograph TWRI3A5-fig3 is being tested here.
n <- 30; bB <- sort(runif(n));
weir.broadcrest(rep(1,n), b=8, B=11, contractratio=bB, P=6, L=3.25);

# Randomly pick lengths and likely kick-off some sharp-crested messages
# Nomograph TWRI3A5-fig6 is being tested here.
L <- sort(runif(n, min=1, max=30));
weir.broadcrest(rep(10,n), b=8, B=11, P=6, L=L);

# Flow estimate in the non-low.head.classification
# Nomograph TWRI3A5-fig23 is being tested here.
weir.broadcrest(.1, b=6, B=6, P=4, L=1);
# Slighly lower are a realistic step change in h. See how the C
# changes dramatically by  (TWRI3A5-fig23), but at 0.01 feet there
#is some smoothness in the result.
weir.broadcrest(.09, b=6, B=6, P=4, L=1);
# Now try extremely close to 0.10 feet
weir.broadcrest(.0999999, b=6, B=6, P=4, L=1);
# Now try switching from "paved" to "gravel" nomograph (TWRI3A5-fig23)
weir.broadcrest(.09, b=6, B=6, P=4, L=1, low.head.class="gravel");

# Nomograph TWRI3A5-fig7 is being tested here for upstream slope
weir.broadcrest(0.5, slopeus="3:1",     b=8, B=11, P=6, L=3.25);
weir.broadcrest(0.5, slopeus="2:1",     b=8, B=11, P=6, L=3.25);
weir.broadcrest(0.5, slopeus="1.999:1", b=8, B=11, P=6, L=3.25);
weir.broadcrest(0.5, slopeus="0.51:1",  b=8, B=11, P=6, L=3.25);
weir.broadcrest(0.5, slopeus="0.50:1",  b=8, B=11, P=6, L=3.25);
weir.broadcrest(0.5, slopeus="0.49:1",  b=8, B=11, P=6, L=3.25);
try(weir.broadcrest(0.5, slopeus="force-error", b=8, B=11, P=6, L=3.25));

# Nomograph TWRI3A5-p9 (table) is being tested here for
# various downstream slopes
weir.broadcrest(3.5, slopeds="1:1",    b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="2:1",    b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="2.5:1",  b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="3:1",    b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="3.5:1",  b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="4.99:1", b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="5:1",    b=6, B=11, P=6, L=3.25);
weir.broadcrest(3.5, slopeds="5.1:1",  b=6, B=11, P=6, L=3.25);


# Now configure some weirs for which kc, kr, ks, and C are all
# looked up starting with some (R)ounding and then some more
# (r)ounding and note the changes to kr
weir.broadcrest(3.5, slopeds="3.5:1",  R=0, b=6, B=11, P=6, L=3.25);
# change kr by crest rounding
weir.broadcrest(3.5, slopeds="3.5:1",  R=1, b=6, B=11, P=6, L=3.25);
# change kc by abutment rounding
weir.broadcrest(3.5, slopeds="3.5:1",  R=1, r=.5, b=6, B=11, P=6, L=3.25);
# Now force override of all coefficients
weir.broadcrest(3.5, slopeds="3.5:1",  R=1, r=.5, b=6, B=11, P=6, L=3.25,
                kc=0.95, kr=1.01, ks=.94, C=3.1);


# Now vectorize the coefficients
weir.broadcrest(rep(0.5,3), b=8, B=11, P=6, L=3.25, C=c(3, 3.1, 3.2),
    kc=c(0.95, 1, 1.05), kr=c(1, 1.03, 1.08), ks=c(0.99, 0.95, 0.90));


# Now create a rating curve
h <- seq(0.01,2,by=.01);
Q <- weir.broadcrest(h, b=8, B=11, P=6, L=3.25);
plot(Q$flow, Q$head, type="l", col=8, lwd=7,
     xlab="DISCHARGE, IN CUBIC FEET PER SECOND",
     ylab="HEAD ON WEIR, IN FEET");
lines(sort(Q$flow), Q$head, col=2, lty=2, lwd=3);

# Now take the Q, repeat the sort and then recompute the delta
ii <- order(Q$flow);
Q <- Q[ii,]; # sort the entire data frame
Q$delta <- c(NA, diff(Q$flow)); # recompute deltas
# This insures a monotonic increasing relations between h and Q
# even though it might not be as smooth as hand-guided
# interpolation would provide.



