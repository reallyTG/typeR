set.seed(1)

isSymmetricMatrix = function(mat) {
  all(mat == t(mat))
}
