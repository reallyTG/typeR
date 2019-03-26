library(numbers)


### Name: isPrime
### Title: isPrime Property
### Aliases: isPrime

### ** Examples

  x <- matrix(1:10, nrow=10, ncol=10, byrow=TRUE)
  x * isPrime(x)

  # Find first prime number octett:
  octett <- c(0, 2, 6, 8, 30, 32, 36, 38) - 19
  while (TRUE) {
      octett <- octett + 210
      if (all(isPrime(octett))) {
          cat(octett, "\n", sep="  ")
          break
      }
  }



