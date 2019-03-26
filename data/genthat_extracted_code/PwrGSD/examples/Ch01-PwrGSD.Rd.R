library(PwrGSD)


### Name: PwrGSD
### Title: Calculate Power in a Group Sequential Design
### Aliases: PwrGSD
### Keywords: survival htest design

### ** Examples


library(PwrGSD)

test.example <-
  PwrGSD(EfficacyBoundary = LanDemets(alpha = 0.05, spending = ObrienFleming),
         FutilityBoundary = LanDemets(alpha = 0.1, spending = ObrienFleming),
	 RR.Futility = 0.82, sided="1<",method="A",accru =7.73, accrat =9818.65,
         tlook =c(7.14, 8.14, 9.14, 10.14, 10.64, 11.15, 12.14, 13.14,
                  14.14, 15.14, 16.14, 17.14, 18.14, 19.14, 20.14),
         tcut0 =0:19, h0 =c(rep(3.73e-04, 2), rep(7.45e-04, 3),
                            rep(1.49e-03, 15)),
         tcut1 =0:19, rhaz =c(1, 0.9125, 0.8688, 0.7814, 0.6941,
                              0.6943, 0.6072, 0.5202, 0.4332, 0.6520,
                              0.6524, 0.6527, 0.6530, 0.6534, 0.6537,
                              0.6541, 0.6544, 0.6547, 0.6551, 0.6554),
         tcutc0 =0:19, hc0 =c(rep(1.05e-02, 2), rep(2.09e-02, 3),
                              rep(4.19e-02, 15)),
         tcutc1 =0:19, hc1 =c(rep(1.05e-02, 2), rep(2.09e-02, 3),
                              rep(4.19e-02, 15)),
         tcutd0B =c(0, 13), hd0B =c(0.04777, 0),
         tcutd1B =0:6, hd1B =c(0.1109, 0.1381, 0.1485, 0.1637, 0.2446,
                               0.2497, 0),
         noncompliance =crossover, gradual =TRUE,
         WtFun =c("FH", "SFH", "Ramp"),
         ppar =c(0, 1, 0, 1, 10, 10))



