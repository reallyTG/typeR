library(PKI)


### Name: RSA
### Title: PKI functions handling RSA keys
### Aliases: RSA PKI.genRSAkey PKI.load.key PKI.save.key PKI.mkRSApubkey
###   PKI.load.OpenSSH.pubkey
### Keywords: manip

### ** Examples

# generate 2048-bit RSA key
key <- PKI.genRSAkey(bits = 2048L)

# extract private and public parts as PEM
priv.pem <- PKI.save.key(key)
pub.pem <- PKI.save.key(key, private=FALSE)
# load back the public key separately
pub.k <- PKI.load.key(pub.pem)

# encrypt with the public key
x <- PKI.encrypt(charToRaw("Hello, world!"), pub.k)
# decrypt with private key
rawToChar(PKI.decrypt(x, key))

# compute SHA1 hash (fingerprint) of the public key
PKI.digest(PKI.save.key(key, "DER", private=FALSE))

# convert OpenSSH public key to PEM format
PKI.load.OpenSSH.pubkey("ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAIEAuvOXqfZ3pJeWeqyQOIXZwmgM1RBqPUmVx3XgntpA+YtOZjKfuoJSpg3LhBuI/wXx8L2QZXNFibvX4qX2qoYsbHvkz2uonA3F7HRhCR/BJURR5nT135znVqALZo328v86HDsVWYR2/JzY1X8GI2R2iKUMGXF0hVuRphdwLB735CU= foo@mycomputer", format="PEM")



