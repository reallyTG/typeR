## ---- warning = FALSE, message = FALSE, tidy = TRUE----------------------
install.load::load_package("iemisc", "iemiscdata", "rivr")
# load needed packages using the load_package function from the install.load package (it is assumed that you have already installed these packages)


# 1) Practice Problem 14.10 from Mott (page 391-392)

# What is the Q (discharge) for this cross-section?

# See nchannel in iemiscdata for the Manning's n table that the following example uses
# Use the normal Manning's n value for Natural streams - minor streams (top width at floodstage < 100 ft), Lined or Constructed Channels, Concrete, and unfinished.

# The 1st heading is "Manning's n for Channels"
# The 2nd heading is "Natural streams - minor streams (top width at floodstage < 100 ft)"
# The 3rd heading is "Lined or Constructed Channels,"
# The 4th heading is "Concrete"
# The 5th heading is "unfinished"


data(nchannel)
# load the data set nchannel from iemiscdata

nlocation <- grep("unfinished", nchannel$"Type of Channel and Description")
# search for the term "unfinished" in the "Type of Channel and Description" column in the nchannel data set

nlocation

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n
# the value of n will be found in column 3 at the location specified by nlocation

n

Q <- Manningrect(b = 3.5, y = 2, Sf = 0.1/100, n = n, units = "SI")
# b = 3.5 m, y = 2 m, Sf = 0.1 percent m/m, n = 0.017, units = SI units
# This will solve for Q since it is missing and Q will be in m^3/s

# Note: Q (discharge), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

Q


# What is the critical depth for this given discharge?

critical_depth(Q$Q, 2, 9.80665, 3.5, 0)




# 2) Problem 1 from Hauser (page 88)

# What is the Sf (slope) for this cross-section?

Sf <- Manningrect(Q = 6.25 * 8 * 14.9, b = 8, y = 6.25, n = 0.01, units = "Eng")
# Q = 6.25 ft * 8 ft * 14.9 ft/sec, b = 8 ft, y = 6.25 ft, n = 0.01, units = Eng units
# This will solve for Sf since it is missing and Sf will be in ft/ft

# Note: Sf (slope), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

Sf


# What is the critical depth for this given discharge?

critical_depth(6.25 * 8 * 14.9, 6.25, 9.80665 * (3937 / 1200), 8, 0)

## ---- warning = FALSE, message = FALSE, tidy = TRUE----------------------
install.load::load_package("iemisc", "iemiscdata", "rivr")
# load needed packages using the load_package function from the install.load package (it is assumed that you have already installed these packages)


# 3) Practice Problem 14.17 from Mott (page 392)

# What is the y (flow depth) for this cross-section?

# See nchannel in iemiscdata for the Manning's n table that the following example uses
# Use the normal Manning's n value for Natural streams - minor streams (top width at floodstage < 100 ft), Lined or Constructed Channels, Concrete, and unfinished.

# The 1st heading is "Manning's n for Channels"
# The 2nd heading is "Natural streams - minor streams (top width at floodstage < 100 ft)"
# The 3rd heading is "Lined or Constructed Channels,"
# The 4th heading is "Concrete"
# The 5th heading is "unfinished"

data(nchannel)
# load the data set nchannel from iemiscdata

nlocation <- grep("unfinished", nchannel$"Type of Channel and Description")
# search for the term "unfinished" in the "Type of Channel and Description" column in the nchannel data set

nlocation

n <- nchannel[nlocation, 3] # 3 for column 3 - Normal n
# the value of n will be found in column 3 at the location specified by nlocation

n

y <- Manningtrap(Q = 15, b = 3, m = 1 / tand(40), Sf = 0.1/100, n = n, units = "SI")
# Q = 15, b = 3 m, m = 1 / tand(40), Sf = 0.1 percent m/m, n = 0.017, units = SI units
# This will solve for y since it is missing and y will be in m

# Note: y (flow depth), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

y


# What is the critical depth for this given discharge?

critical_depth(15, y$y, 9.80665, 3, 1 / tand(40))




# 4) Example 2 from FHWA

# What is the y (flow depth) for this cross-section?

y <- Manningtrap(Q = 150, b = 4, m = 2, Sf = 2/100, n = 0.030, units = "Eng")
# Q = 150 cfs, b = 4 ft, m = 2, Sf = 2/100 ft/ft, n = 0.030, units = Eng units
# This will solve for y since it is missing and y will be in ft

# Note: y (flow depth), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

y


# What is the critical depth for this given discharge?

critical_depth(150, y$y, 9.80665 * (3937 / 1200), 4, 2)

## ---- warning = FALSE, message = FALSE, tidy = TRUE----------------------
install.load::load_package("iemisc", "rivr")
# load needed packages using the load_package function from the install.load package (it is assumed that you have already installed these packages)


# 5) Problem 17 from Hauser (page 89)

# What is the Q (discharge) for this cross-section?

Q <- Manningtri(y = 6, m = 4, Sf = 0.006, n = 0.025, units = "Eng")
# y = 6 ft, m = 4 ft/ft, Sf = 0.006 ft/ft, n = 0.025, units = Eng units
# This will solve for Q since it is missing and Q will be in ft^3/s

# Note: Q (discharge), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

Q


# What is the critical depth for this given discharge?

critical_depth(Q$Q, 6, 9.80665 * (3937 / 1200), 0, 4)




# 6) Example 2 from FHWA

# What is the y (flow depth) for this cross-section?

y <- Manningtri(Q = 150, m = 2, Sf = 2/100, n = 0.030, units = "Eng")
# Q = 150 cfs, m = 2, Sf = 2/100 ft/ft, n = 0.030, units = Eng units
# This will solve for y since it is missing and y will be in ft

# Note: y (flow depth), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

y


# What is the critical depth for this given discharge?

critical_depth(150, y$y, 9.80665 * (3937 / 1200), 4, 2)

## ------------------------------------------------------------------------
library(iemisc)

# 7) Modified Practice Problem 14.32/14.34 from Mott (page 393)

# What is the Q (discharge) for this cross-section?

Q <- Manningcirc(d = 375/1000, y = 225/1000, Sf = 0.12/100, n = 0.015, units = "SI")
# d = 375/1000 m, y = 225/1000 m, Sf = 0.12/100 m/m, n = 0.015, units = SI units
# This will solve for Q since it is missing and Q will be in m^3/s

# Note: Q (discharge), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

Q




# 8) Problem 18 from Hauser (page 89)

# What is the Q (discharge) for this cross-section?

Q <- Manningcirc(d = 10/12, y = 3/12, Sf = 2/100, n = 0.025, units = "Eng")
# d = 10/12 ft, y = 3/12 ft, Sf = 2/100 ft/ft, n = 0.025, units = Eng units
# This will solve for Q since it is missing and Q will be in ft

# Note: Q (discharge), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

Q

## ------------------------------------------------------------------------
library(iemisc)

# 9) Modified Exercise 4.3 from Sturm (page 153)

# What is the B1 ("bank-full width") for this cross-section?

B1 <- Manningpara(Q = 32.2, y = 8, y1 = 5.1, Sf = 0.0092, n = 0.025, units = "SI")
# Q = 32.2 m^3/s, y = 8 m, y1 = 5.1 m, Sf = 0.0092 m/m, n = 0.025, units = SI units
# This will solve for B1 since it is missing and B1 will be in m

# Note: B1 ("bank-full width"), velocity (V), area (A), wetted perimeter (P), R (hydraulic radius), Re (Reynolds number), and Fr (Froude number) are returned as an R list

B1

