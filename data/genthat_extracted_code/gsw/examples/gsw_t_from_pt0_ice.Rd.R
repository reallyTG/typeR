library(gsw)


### Name: gsw_t_from_pt0_ice
### Title: In situ Temperature from Potential Temperature at 0dbar
### Aliases: gsw_t_from_pt0_ice

### ** Examples

pt0_ice  <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
t <- gsw_t_from_pt0_ice(pt0_ice, p)
expect_equal(t, c(-10.783412084414074, -13.422068638139141, -12.783170223330448,
                -12.205667526492039, -10.755496924674144, -8.184121042593350))



